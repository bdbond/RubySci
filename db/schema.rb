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

ActiveRecord::Schema.define(:version => 20120207172309) do

  create_table "data", :force => true do |t|
    t.integer   "dataset_id"
    t.float     "pressure"
    t.float     "voltage"
    t.float     "amperage"
    t.float     "darkspace"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "datasets", :force => true do |t|
    t.string    "name"
    t.string    "mat_p"
    t.string    "geo_p"
    t.string    "mat_n"
    t.string    "geo_n"
    t.timestamp "created_at",                  :null => false
    t.timestamp "updated_at",                  :null => false
    t.integer   "user_id"
    t.integer   "status"
    t.float     "dist",       :default => 0.0
    t.string    "comment"
  end

  create_table "news_items", :force => true do |t|
    t.string    "text"
    t.integer   "user_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string    "role_name"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string    "name"
    t.string    "email"
    t.string    "password_digest"
    t.timestamp "created_at",                     :null => false
    t.timestamp "updated_at",                     :null => false
    t.integer   "role_id",         :default => 1
  end

end
