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

ActiveRecord::Schema.define(version: 20180322191425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enderecos", force: :cascade do |t|
    t.string "logradouro"
    t.string "tipo_logradouro"
    t.string "numero"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "instituicao_id"
    t.index ["instituicao_id"], name: "index_enderecos_on_instituicao_id"
  end

  create_table "instituicaos", force: :cascade do |t|
    t.string "nome_instituicao"
    t.string "nome_relatorio_instituicao"
    t.string "codigo_instituicao"
    t.string "codigo_produto", default: 1, null: false
    t.string "logo"
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telefones", force: :cascade do |t|
    t.integer "codigo_area"
    t.string "numero"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "instituicao_id"
    t.index ["instituicao_id"], name: "index_telefones_on_instituicao_id"
  end

  create_table "usuario_nextis", force: :cascade do |t|
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
    t.string "login"
    t.index ["email"], name: "index_usuario_nextis_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuario_nextis_on_reset_password_token", unique: true
  end

  add_foreign_key "enderecos", "instituicaos"
  add_foreign_key "telefones", "instituicaos"
end
