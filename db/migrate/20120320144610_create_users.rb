class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :prename
      t.string :fname
      t.string :lname
      t.string :mobile
      t.string :role
      t.string :password_digest

      t.timestamps
    end
  end
end
