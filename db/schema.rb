# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120319110139) do

  create_table "blocks", :force => true do |t|
    t.integer "chapter_id"
    t.string  "block_no",    :limit => 7
    t.string  "block_title"
  end

  create_table "chapters", :force => true do |t|
    t.string "chap_no",    :limit => 2
    t.string "chap_title", :limit => 110
  end

  create_table "codes", :force => true do |t|
    t.integer "block_id"
    t.string  "code_3",     :limit => 3
    t.string  "code_6",     :limit => 6
    t.string  "code_title"
  end

  create_table "faqs", :force => true do |t|
    t.string "faq_item"
    t.string "faq_q"
    t.string "faq_a"
  end

end
