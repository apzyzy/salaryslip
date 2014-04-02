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

ActiveRecord::Schema.define(:version => 20140314095957) do

  create_table "salaries", :force => true do |t|
    t.string  "name"
    t.float   "basic"
    t.float   "hra"
    t.float   "children_allowance",          :default => 0.0
    t.float   "transport_allowance",         :default => 0.0
    t.float   "medical_allowance",           :default => 0.0
    t.float   "tech_research_allowance",     :default => 0.0
    t.float   "special_allowance",           :default => 0.0
    t.float   "internet_and_telephone",      :default => 0.0
    t.float   "pf_contribution_by_employer", :default => 0.0
    t.float   "leave_travel_allowance",      :default => 0.0
    t.float   "gross_salary",                :default => 0.0
    t.float   "tds",                         :default => 0.0
    t.float   "pf",                          :default => 0.0
    t.float   "advance",                     :default => 0.0
    t.float   "net_payable",                 :default => 0.0
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "pan"
    t.string   "designation"
    t.string   "pf"
    t.date     "joined_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
