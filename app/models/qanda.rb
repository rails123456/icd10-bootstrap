class Qanda < ActiveRecord::Base
  belongs_to :user

  if @current_user && @current_user.role == 'member'
    scope :only_owner, where(:user_id => @current_user.id) 
  else
    scope :only_owner, all
  end
end
