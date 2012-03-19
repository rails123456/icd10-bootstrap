class Code < ActiveRecord::Base
  belongs_to :block
  belongs_to :chapter

  def self.search(search)
    if search
      kw = search.split(/\!/)
      where('upper(code_6 || code_title) LIKE ?', "%#{kw[0].to_s.upcase}%").where('upper(code_6 || code_title) LIKE ?', "%#{kw[1].to_s.upcase}%").where('upper(code_6 || code_title) LIKE ?', "%#{kw[2].to_s.upcase}%")
    else
      scoped
    end
  end
end
