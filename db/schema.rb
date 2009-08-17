# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090814214356) do

  create_table "agencias", :force => true do |t|
    t.integer "banco_id", :null => false
    t.integer "codigo",   :null => false
    t.string  "nome",     :null => false
  end

  create_table "bancos", :force => true do |t|
    t.integer "codigo", :null => false
    t.string  "nome",   :null => false
  end

  create_table "clientes", :force => true do |t|
    t.string "nome", :null => false
  end

  create_table "duplicatas_a_receber", :force => true do |t|
    t.integer  "pedido_id"
    t.integer  "cliente_id",                                        :null => false
    t.integer  "lancamento_id"
    t.integer  "plano_de_contas_id",                                :null => false
    t.string   "tipo_de_cobranca",                                  :null => false
    t.integer  "agencia_id"
    t.string   "cheque"
    t.string   "serie_do_cheque"
    t.string   "cheque_nominal_a"
    t.integer  "vendedor_id"
    t.date     "data_de_emissao",                                   :null => false
    t.date     "data_de_vencimento",                                :null => false
    t.decimal  "valor",              :precision => 12, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grupos_de_despesas", :force => true do |t|
    t.string "nome", :null => false
  end

  create_table "plano_de_contas", :force => true do |t|
    t.string  "nome",                                  :null => false
    t.string  "tipo",                                  :null => false
    t.boolean "habilitado",          :default => true
    t.integer "banco_id",                              :null => false
    t.integer "grupo_de_despesa_id",                   :null => false
  end

  create_table "rubricas", :force => true do |t|
    t.string   "codigo"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendedores", :force => true do |t|
    t.string "nome", :null => false
  end

end
