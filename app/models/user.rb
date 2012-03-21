class User < ActiveRecord::Base
  has_secure_password
  has_many :qandas

  attr_accessible :email, :prename, :fname, :lname, :mobile, :role, :password, :password_confirmation

  validates_uniqueness_of :email

  def fullname
    "#{self.prename}#{self.fname} #{self.lname}"
  end
end
