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

ActiveRecord::Schema[8.0].define(version: 2025_09_30_172015) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "carrinho_produtos", force: :cascade do |t|
    t.bigint "carrinho_id", null: false
    t.bigint "produto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrinho_id"], name: "index_carrinho_produtos_on_carrinho_id"
    t.index ["produto_id"], name: "index_carrinho_produtos_on_produto_id"
  end

  create_table "carrinhos", force: :cascade do |t|
    t.integer "quantidadeProduto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usuario_id", null: false
    t.index ["usuario_id"], name: "index_carrinhos_on_usuario_id"
  end

  create_table "categoria", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "configuracao_usuarios", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.bigint "configuracao_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "valor"
    t.index ["configuracao_id"], name: "index_configuracao_usuarios_on_configuracao_id"
    t.index ["usuario_id"], name: "index_configuracao_usuarios_on_usuario_id"
  end

  create_table "configuracaos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "rua"
    t.string "cidade"
    t.string "cep"
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_enderecos_on_usuario_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "titulo"
    t.text "conteudo"
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_posts_on_usuario_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.float "preco"
    t.bigint "categoria_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_id"], name: "index_produtos_on_categoria_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "senha"
  end

  add_foreign_key "carrinho_produtos", "carrinhos"
  add_foreign_key "carrinho_produtos", "produtos"
  add_foreign_key "carrinhos", "usuarios"
  add_foreign_key "configuracao_usuarios", "configuracaos"
  add_foreign_key "configuracao_usuarios", "usuarios"
  add_foreign_key "enderecos", "usuarios"
  add_foreign_key "posts", "usuarios"
  add_foreign_key "produtos", "categoria", column: "categoria_id"
end
