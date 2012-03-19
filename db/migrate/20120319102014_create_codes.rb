class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.integer :block_id
      t.string :code_3
      t.string :code_6
      t.string :code_title
    end
  end
end
