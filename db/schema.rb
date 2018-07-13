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

ActiveRecord::Schema.define(version: 20180713162527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_reviews", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "review_id"
    t.index ["book_id"], name: "index_book_reviews_on_book_id"
    t.index ["review_id"], name: "index_book_reviews_on_review_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "book_id"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "book_reviews", "books"
  add_foreign_key "book_reviews", "reviews"
  add_foreign_key "reviews", "books"
end
