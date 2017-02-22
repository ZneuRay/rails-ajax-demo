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

ActiveRecord::Schema.define(version: 20170222153859) do

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "category_id"
    t.string   "isbn"
    t.string   "title"
    t.string   "name"
    t.string   "author"
    t.datetime "release_date"
    t.string   "type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["author"], name: "index_books_on_author", using: :btree
    t.index ["category_id"], name: "index_books_on_category_id", using: :btree
    t.index ["isbn"], name: "index_books_on_isbn", unique: true, using: :btree
    t.index ["name"], name: "index_books_on_name", using: :btree
    t.index ["release_date"], name: "index_books_on_release_date", using: :btree
    t.index ["title"], name: "index_books_on_title", using: :btree
  end

end
