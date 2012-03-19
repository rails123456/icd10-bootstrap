class Block < ActiveRecord::Base
  validates_presence_of :block_no, :block_title

  belongs_to :chapter
  has_many :codes

  def self.search(search)
    if search
      kw = search.split(/\!/)
      where('upper(block_title) LIKE ?', "%#{kw[0].to_s.upcase}%").where('upper(block_title) LIKE ?', "%#{kw[1].to_s.upcase}%").where('upper(block_title) LIKE ?', "%#{kw[2].to_s.upcase}%")
    else
      scoped
    end
  end

end
