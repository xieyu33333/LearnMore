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

ActiveRecord::Schema.define(:version => 20130826161734) do

  create_table "admins", :force => true do |t|
    t.string   "username"
    t.string   "email"
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
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "blogs", :force => true do |t|
    t.text     "artical",         :limit => 16777215
    t.integer  "user_id"
    t.string   "title",           :limit => 100
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.integer  "faverates_count",                     :default => 0
    t.string   "blogtype"
    t.integer  "hit",                                 :default => 0
    t.integer  "section_id"
    t.integer  "sort",                                :default => 100000
    t.integer  "status",          :limit => 1,        :default => 0
    t.integer  "editer",                              :default => 0
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "downloads", :force => true do |t|
    t.integer  "user_id"
    t.integer  "studyfile_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "faverates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "studyfile_id"
    t.integer  "blog_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.string   "urlname"
    t.text     "description"
    t.text     "rule"
    t.integer  "parent_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "name",                                    :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.text     "description"
    t.integer  "status",      :limit => 1, :default => 0
    t.integer  "pid"
  end

  create_table "sections_users", :force => true do |t|
    t.integer  "section_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "studyfiles", :force => true do |t|
    t.string   "filename"
    t.string   "filetype",        :default => "0",    :null => false
    t.integer  "downloads_count", :default => 0,      :null => false
    t.integer  "faverates_count", :default => 0,      :null => false
    t.string   "file_url"
    t.integer  "user_id",                             :null => false
    t.integer  "point",           :default => 0,      :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "section_id"
    t.text     "description"
    t.string   "outsite"
    t.integer  "sort",            :default => 100000
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "forum_id",        :limit => 2, :default => 0, :null => false
    t.integer  "status",          :limit => 1, :default => 0, :null => false
    t.integer  "faverates_count"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password",                                    :default => "",    :null => false
    t.boolean  "admin",                                                 :default => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
    t.integer  "point",                                                 :default => 10
    t.decimal  "cost",                   :precision => 10, :scale => 0, :default => 0
    t.integer  "all_point",                                             :default => 10
    t.text     "description"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
