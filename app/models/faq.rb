class Faq < ActiveRecord::Base
  belongs_to :specialty
  
  scope :med, lambda{ where("specialty_id=1") }
  
  def self.search(search)
    if search
      kw = search.split(/\!/)
      where('upper(faq_q || faq_a) LIKE ?', "%#{kw[0].to_s.upcase}%").where('upper(faq_q || faq_a) LIKE ?', "%#{kw[1].to_s.upcase}%").where('upper(faq_q || faq_a) LIKE ?', "%#{kw[2].to_s.upcase}%")
    else
      scoped
    end
  end

end
