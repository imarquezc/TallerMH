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

ActiveRecord::Schema.define(version: 20160728152303) do

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
  end

  add_index "cars", ["client_id"], name: "index_cars_on_client_id"

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
  end

  create_table "compras", force: :cascade do |t|
    t.integer  "producto"
    t.integer  "p_compra"
    t.integer  "p_venta"
    t.integer  "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "identificador"
    t.text     "descripcion"
    t.integer  "stock"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "marca"
  end

end
