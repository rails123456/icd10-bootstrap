class Qanda < ActiveRecord::Base
  belongs_to :user

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
end
