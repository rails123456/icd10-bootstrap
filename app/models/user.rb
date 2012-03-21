class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :prename, :fname, :lname, :mobile, :role, :password, :password_confirmation

  validates_uniqueness_of :email
end
