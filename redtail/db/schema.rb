# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090201195022) do

  create_table "choices", :force => true do |t|
    t.integer  "restaurant_id"
    t.integer  "selection_id"
    t.boolean  "required"
    t.boolean  "pass"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "decisions", :force => true do |t|
    t.integer  "reservation_id"
    t.integer  "selection_id"
    t.integer  "option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lunch_periods", :force => true do |t|
    t.integer  "period"
    t.string   "name"
    t.string   "begin_end_times"
    t.boolean  "to_go_available"
    t.boolean  "eat_in_available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", :force => true do |t|
    t.integer  "selection_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.integer  "lunch_period_id"
    t.boolean  "to_go"
    t.string   "special_request"
    t.integer  "number_of_guests"
    t.string   "names_of_guests"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.float    "price"
    t.boolean  "open"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "selections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "hashed_password", :limit => 40
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "email_confirmed",               :default => false
    t.boolean  "admin",                         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
