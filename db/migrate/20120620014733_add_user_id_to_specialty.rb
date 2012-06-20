class AddUserIdToSpecialty < ActiveRecord::Migration
  def change
    add_column :specialties, :user_id, :integer
  end
end
