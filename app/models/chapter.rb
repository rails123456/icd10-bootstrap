class Chapter < ActiveRecord::Base
  validates_presence_of :chap_no, :chap_title

  has_many :blocks
  has_many :codes, :through => :blocks

  def self.search(search)
    if search
      kw = search.split(/\!/)
      where('upper(chap_title) LIKE ?', "%#{kw[0].to_s.upcase}%").where('upper(chap_title) LIKE ?', "%#{kw[1].to_s.upcase}%").where('upper(chap_title) LIKE ?', "%#{kw[2].to_s.upcase}%")
    else
      scoped
    end
  end
end
