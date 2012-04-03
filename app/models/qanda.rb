require 'net/http'

class Qanda < ActiveRecord::Base
  belongs_to :user

  after_update :send_sms
  after_update :insert_faqs

  scope :unanswered, where("qa_status != 'answered'")

  def insert_faqs
    return if self.qa_status != 'answered'
    owner = self.user_id
    item = owner
    q = self.qa_q
    a = self.qa_a
    o = Faq.new
    o.attributes = {:faq_item => item, :faq_q => q, :faq_a => a}
    id = o.save
  end

  def send_sms
    return if self.qa_status != 'consulting'

    consultant = User.find(self.qa_consultant)

    msg = "New ICD Question has just arrived <ICD10forum>"
    msg = msg.gsub(/\ /,'+')
    t = Time.now
    yy = t.year - 2000
    mm = sprintf("%02d", t.mon)
    dd = sprintf("%02d", t.day)
    hr = sprintf("%02d", t.hour)
    mn = sprintf("%02d", t.min)
    time = "#{yy}#{mm}#{dd}#{hr}#{mn}"

    http = Net::HTTP.new('www.thaibulksms.com')
    req = "&msisdn=0819163691,0805815667&message=#{msg}&sender=SMS"
    req += "&ScheduledDelivery=#{time}&force=standard"
    path = "/sms_api.php?username=0819163691&password=914212#{req}"
    resp, data = http.get(path)
  end
end
