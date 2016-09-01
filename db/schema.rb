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

ActiveRecord::Schema.define(version: 20160830154900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.string   "routing_num",       null: false
    t.string   "office_code"
    t.integer  "frb_num"
    t.integer  "record_type_code"
    t.string   "last_change_date"
    t.string   "new_routing_num"
    t.text     "cust_name"
    t.text     "city"
    t.string   "zipcode"
    t.string   "zipcode_ext"
    t.integer  "inst_status__code"
    t.integer  "data_view_code"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "tel_number"
    t.string   "street_address"
    t.string   "state"
  end

end
