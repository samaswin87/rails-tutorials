# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_15_134840) do

  create_table "active_dynamic_attributes", force: :cascade do |t|
    t.integer "customizable_id", null: false
    t.string "customizable_type", limit: 50
    t.string "name"
    t.string "display_name", null: false
    t.integer "datatype"
    t.text "value"
    t.boolean "required", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["customizable_id"], name: "index_active_dynamic_attributes_on_customizable_id"
    t.index ["customizable_type"], name: "index_active_dynamic_attributes_on_customizable_type"
  end

  create_table "records", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
