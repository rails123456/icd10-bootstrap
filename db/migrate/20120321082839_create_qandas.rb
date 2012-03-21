class CreateQandas < ActiveRecord::Migration
  def change
    create_table :qandas do |t|
      t.integer :user_id
      t.text :qa_q
      t.text :qa_a
      t.string :qa_status

      t.timestamps
    end
  end
end
