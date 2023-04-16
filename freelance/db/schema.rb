# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_04_15_223904) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phonenumber"
    t.string "nif"
    t.integer "freelancer_id"
    t.string "access_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["freelancer_id"], name: "index_clients_on_freelancer_id"
  end

  create_table "deadlines", force: :cascade do |t|
    t.string "name"
    t.integer "project_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_deadlines_on_project_id"
  end

  create_table "documents", force: :cascade do |t|
    t.text "name"
    t.string "source_type", null: false
    t.integer "source_id", null: false
    t.string "author_type", null: false
    t.integer "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_documents_on_author"
    t.index ["source_type", "source_id"], name: "index_documents_on_source"
  end

  create_table "freelancers", force: :cascade do |t|
    t.string "name"
    t.string "brand_name", default: "MesModder"
    t.string "eth_nonce"
    t.string "eth_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_freelancers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_freelancers_on_reset_password_token", unique: true
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.string "notable_type", null: false
    t.integer "notable_id", null: false
    t.string "author_type", null: false
    t.integer "author_id", null: false
    t.boolean "change", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_notes_on_author"
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "deadline"
    t.integer "status", default: 0
    t.integer "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "deadlines", "projects"
end
