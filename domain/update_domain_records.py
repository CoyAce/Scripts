# coding:utf-8
from aliyunsdkcore.client import AcsClient
from aliyunsdkalidns.request.v20150109 import DescribeDomainsRequest, DescribeDomainRecordsRequest, \
    UpdateDomainRecordRequest
import json, sys, socket


# 更新域名ip
def update_domain_record(host_name, record_id, types, IP):
    request = UpdateDomainRecordRequest.UpdateDomainRecordRequest()
    request.set_accept_format('json')
    request.set_RecordId(record_id)
    request.set_RR(host_name)
    request.set_Type(types)
    request.set_TTL('600')
    request.set_Value(IP)
    response = json.loads(client.do_action_with_exception(request))
    print response


# 获取域名信息并更新ip
def get_all_domain_records_then_update(domain_name, Types, IP):
    request = DescribeDomainRecordsRequest.DescribeDomainRecordsRequest()
    request.set_accept_format('json')
    request.set_DomainName(domain_name)
    response = json.loads(client.do_action_with_exception(request))
    print response
    for HostName in ['www', '@']:
        for x in response['DomainRecords']['Record']:
            RR = x['RR']
            Type = x['Type']
            if RR == HostName and Type == Types:
                RecordId = x['RecordId']
                print RecordId
                update_domain_record(HostName, RecordId, Types, IP)


# 请求参数参数
local_ip = socket.gethostbyname(socket.getfqdn(socket.gethostname()))
DomainName = sys.argv[1]
AccessKeyId = sys.argv[2]
AccessKeySecret = sys.argv[3]
if len(sys.argv) > 4:
    local_ip = sys.argv[4]

# 创建AcsClient实例
client = AcsClient(
    AccessKeyId,
    AccessKeySecret,
    "cn-beijing"
);

get_all_domain_records_then_update(DomainName, "A", local_ip)
