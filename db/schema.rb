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

ActiveRecord::Schema.define(version: 2023_07_08_080214) do

  create_table "destinations", force: :cascade do |t|
    t.string "type"
    t.integer "destination_id"
    t.string "description"
    t.integer "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [nil], name: "index_destinations_on_equity_transaction_id"
  end

  create_table "equity_transactions", force: :cascade do |t|
    t.integer "activity_id"
    t.datetime "date"
    t.string "transaction_type"
    t.string "method"
    t.float "amount"
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "requester_type"
    t.string "source_type"
    t.integer "source_id"
    t.string "source_description"
    t.string "destination_type"
    t.integer "destination_id"
    t.string "destination_description"
  end

  create_table "requesters", force: :cascade do |t|
    t.string "type"
    t.integer "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [nil], name: "index_requesters_on_equity_transaction_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "type"
    t.integer "source_id"
    t.string "description"
    t.integer "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [nil], name: "index_sources_on_equity_transaction_id"
  end

end
