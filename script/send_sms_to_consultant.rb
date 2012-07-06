#!/home/admin/.rvm/rubies/ruby-1.8.7-p358/bin/ruby

require 'net/http'
require 'rubygems'
require 'pg'

def get_mobile(sp)

  #User(id: integer, email: string, prename: string, 
  #     fname: string, lname: string, mobile: string, 
  #     role: string, password_digest: string, 
  #     created_at: datetime, updated_at: datetime)

  #Specialty(id: integer, sp_code: string, 
  #          sp_name: string, created_at: datetime, 
  #          updated_at: datetime, user_id: integer)

  con = PGconn.connect("localhost",5432,nil,nil,"icd10forum_development","postgres")
  sql = "SELECT mobile "
  sql += "FROM users,specialties "
  sql += "WHERE specialties.id = #{sp} AND "
  sql += "specialties.user_id = users.id "
  res = con.exec(sql)
  con.close
  found = res.num_tuples

  mobile = 'NA'
  
  if found > 0
    res.each do |rec|
      mobile = rec['mobile']
    end
  end
  mobile
end

def send_sms(mobile, time, msg)

  msg = msg.gsub(/\ /,'+')

  http = Net::HTTP.new('www.thaibulksms.com')
  req = "&msisdn=0805815667,#{mobile}&message=#{msg}&sender=SMS"
  req += "&ScheduledDelivery=#{time}&force=standard"
  path = "/sms_api.php?username=0805815667&password=242618#{req}"
  resp, data = http.get(path)

end

t = Time.now
yy = t.year - 2000
mm = sprintf("%02d", t.mon)
dd = sprintf("%02d", t.day)
hr = sprintf("%02d", 19)
mn = sprintf("%02d", 0)
time = "#{yy}#{mm}#{dd}#{hr}#{mn}"

#Qanda(id: integer, user_id: integer, qa_q: text, 
#      qa_a: text, qa_status: string, qa_consultant: integer, 
#      created_at: datetime, updated_at: datetime, 
#      specialty_id: integer)

con = PGconn.connect("localhost",5432,nil,nil,"icd10forum_development","postgres")
sql = "SELECT specialty_id,count(*) "
sql += "FROM qandas "
sql += "WHERE qa_status = 'consulting' "
sql += "GROUP BY specialty_id"
res = con.exec(sql)
con.close

sp = nil
n = 0
mobile = nil

res.each do |rec|
  sp = rec['specialty_id']
  n = rec['count'].to_i
  mobile = get_mobile(sp)
  mobile = '0819163691'
  if (n > 0)
    if (n == 1)
      msg = "ICD10FORUM: You have 1 new question waiting for answer"
    else
      msg = "ICD10FORUM: You have #{n} new questions waiting for answer"
    end
    send_sms(mobile, time, msg)  
  end
  p msg
end

