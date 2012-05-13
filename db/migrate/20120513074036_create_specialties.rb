class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.string :sp_code
      t.string :sp_name

      t.timestamps
    end
  end
end
