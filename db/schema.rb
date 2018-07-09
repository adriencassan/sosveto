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

ActiveRecord::Schema.define(version: 20180707113707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cliniques", force: :cascade do |t|
    t.string "nom"
    t.string "veterinaires"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultations", force: :cascade do |t|
    t.bigint "garde_id"
    t.string "client_nom"
    t.string "client_adresse"
    t.string "client_ville"
    t.string "client_telephone"
    t.string "client_mail"
    t.bigint "client_clinique_id"
    t.string "animal_nom"
    t.string "animal_espece"
    t.integer "animal_ageA"
    t.integer "animal_ageM"
    t.string "animal_sexe"
    t.string "consultation_motif"
    t.string "consultation_commentaires"
    t.string "consultation_suites"
    t.string "statut_envoi", default: "Non-envoyée"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_clinique_id"], name: "index_consultations_on_client_clinique_id"
    t.index ["garde_id"], name: "index_consultations_on_garde_id"
  end

  create_table "gardes", force: :cascade do |t|
    t.string "titre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "consultations", "cliniques", column: "client_clinique_id"
  add_foreign_key "consultations", "gardes"
end
