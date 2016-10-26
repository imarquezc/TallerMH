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

ActiveRecord::Schema.define(version: 20161026180734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string   "marca"
    t.string   "modelo"
    t.integer  "kilometraje"
    t.string   "color"
    t.text     "comentarios"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "client_id"
    t.string   "patente"
    t.string   "tipo"
    t.integer  "año"
    t.string   "chasis"
  end

  add_index "cars", ["client_id"], name: "index_cars_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "direccion"
    t.string   "comuna"
    t.string   "telefono"
    t.string   "celular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "mail"
    t.string   "rut"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "detalle"
    t.integer  "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "work_id"
    t.integer  "item_id"
    t.integer  "cantidad"
  end

  add_index "comments", ["work_id"], name: "index_comments_on_work_id", using: :btree

  create_table "compras", force: :cascade do |t|
    t.integer  "producto"
    t.integer  "p_compra"
    t.integer  "p_venta"
    t.integer  "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "remaining"
    t.string   "code"
  end

  create_table "items", force: :cascade do |t|
    t.string   "nombre"
    t.string   "identificador"
    t.text     "descripcion"
    t.integer  "stock"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "marca"
    t.string   "fabricante"
    t.string   "modelo"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "works", force: :cascade do |t|
    t.text     "motivo"
    t.string   "tipo"
    t.integer  "kilometraje"
    t.integer  "estanque"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "car_id"
  end

  add_index "works", ["car_id"], name: "index_works_on_car_id", using: :btree

  add_foreign_key "cars", "clients"
  add_foreign_key "comments", "works"
  add_foreign_key "works", "cars"
end
