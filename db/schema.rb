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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160610213609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "faculties", force: :cascade do |t|
    t.string   "name",       :null=>false
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name",       :null=>false
    t.integer  "faculty_id", :null=>false, :index=>{:name=>"fk__schools_faculty_id"}, :foreign_key=>{:references=>"faculties", :name=>"fk_schools_faculty_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "polling_processes", force: :cascade do |t|
    t.string   "name",        :null=>false
    t.text     "description"
    t.integer  "school_id",   :null=>false, :index=>{:name=>"fk__polling_processes_school_id"}, :foreign_key=>{:references=>"schools", :name=>"fk_polling_processes_school_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

  create_table "polling_stations", force: :cascade do |t|
    t.string   "code",               :null=>false
    t.string   "name",               :null=>false
    t.integer  "school_id",          :null=>false, :index=>{:name=>"fk__polling_stations_school_id"}, :foreign_key=>{:references=>"schools", :name=>"fk_polling_stations_school_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "polling_process_id", :null=>false, :index=>{:name=>"fk__polling_stations_polling_process_id"}, :foreign_key=>{:references=>"polling_processes", :name=>"fk_polling_stations_polling_process_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.datetime "created_at",         :null=>false
    t.datetime "updated_at",         :null=>false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  :index=>{:name=>"index_users_on_email", :unique=>true}
    t.string   "encrypted_password"
    t.string   "reset_password_token",   :index=>{:name=>"index_users_on_reset_password_token", :unique=>true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name",             :null=>false
    t.string   "last_name",              :null=>false
    t.string   "phone"
    t.string   "dni",                    :null=>false
    t.string   "code",                   :null=>false
    t.datetime "dob"
    t.integer  "school_id",              :null=>false, :index=>{:name=>"fk__users_school_id"}, :foreign_key=>{:references=>"schools", :name=>"fk_users_school_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.string   "type",                   :null=>false
    t.integer  "polling_process_id",     :index=>{:name=>"fk__users_polling_process_id"}, :foreign_key=>{:references=>"polling_processes", :name=>"fk_users_polling_process_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "polling_station_id",     :index=>{:name=>"fk__users_polling_station_id"}, :foreign_key=>{:references=>"polling_stations", :name=>"fk_users_polling_station_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.decimal  "pending_debt",           :default=>0.0, :null=>false
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
  end

end
