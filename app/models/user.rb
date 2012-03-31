class User < ActiveRecord::Base
  has_secure_password
  has_many :qandas

  attr_accessible :email, :prename, :fname, :lname, :mobile, :role, :password, :password_confirmation

  validates_uniqueness_of :email

  def fullname
    "#{self.prename}#{self.fname} #{self.lname}"
  end

  def self.search(search)
    if search
      kw = search.split(/\!/)
      where('upper(fname || lname || role) LIKE ?', "%#{kw[0].to_s.upcase}%").where('upper(fname || lname || role) LIKE ?', "%#{kw[1].to_s.upcase}%").where('upper(fname || lname || role) LIKE ?', "%#{kw[2].to_s.upcase}%")
    else
      scoped
    end
  end

end
