# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130108140049) do

  create_table "books", :force => true do |t|
    t.string   "isbn"
    t.text     "title"
    t.text     "author"
    t.integer  "page"
    t.text     "description"
    t.integer  "price"
    t.string   "small_image_url"
    t.string   "medium_image_url"
    t.string   "large_image_url"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "detail_page_url"
  end

  add_index "books", ["isbn"], :name => "index_books_on_isbn"

  create_table "tag_books", :force => true do |t|
    t.integer  "book_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tag_books", ["book_id"], :name => "index_tag_books_on_book_id"
  add_index "tag_books", ["tag_id"], :name => "index_tag_books_on_tag_id"

  create_table "tags", :force => true do |t|
    t.integer  "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_books", :force => true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "comment"
  end

  add_index "user_books", ["book_id"], :name => "index_user_books_on_book_id"
  add_index "user_books", ["user_id"], :name => "index_user_books_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.integer  "github_user_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
