class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :chap_no
      t.string :chap_title
    end
  end
end
