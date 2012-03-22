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

ActiveRecord::Schema.define(:version => 20120321082839) do

  create_table "blocks", :force => true do |t|
    t.integer "chapter_id"
    t.string  "block_no"
    t.string  "block_title"
  end

  create_table "chapters", :force => true do |t|
    t.string "chap_no"
    t.string "chap_title"
  end

  create_table "codes", :force => true do |t|
    t.integer "block_id"
    t.string  "code_3"
    t.string  "code_6"
    t.string  "code_title"
  end

  create_table "faqs", :force => true do |t|
    t.string "faq_item"
    t.text   "faq_q"
    t.text   "faq_a"
  end

  create_table "qandas", :force => true do |t|
    t.integer  "user_id"
    t.text     "qa_q"
    t.text     "qa_a"
    t.string   "qa_status"
    t.integer  "qa_consultant"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "prename"
    t.string   "fname"
    t.string   "lname"
    t.string   "mobile"
    t.string   "role"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
