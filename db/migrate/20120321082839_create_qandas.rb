class CreateQandas < ActiveRecord::Migration
  def change
    create_table :qandas do |t|
      t.integer :user_id
      t.text :qa_q
      t.text :qa_a
      t.string :qa_status
      t.integer :qa_consultant
      t.timestamps
    end
  end
end
