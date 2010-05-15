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

ActiveRecord::Schema.define(:version => 20100513152059) do

  create_table "catalogs", :force => true do |t|
    t.string   "art"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "cl_org"
    t.string   "cl_fio"
    t.string   "cl_inn"
    t.string   "cl_kpp"
    t.string   "cl_adrur"
    t.string   "cl_adrfiz"
    t.string   "cl_rs"
    t.string   "cl_bik"
    t.string   "cl_tel"
    t.string   "cl_bank"
    t.string   "cl_ks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "descriptions", :force => true do |t|
    t.integer  "catalod_id"
    t.decimal  "dlina",      :precision => 3, :scale => 2
    t.string   "color"
    t.integer  "shin"
    t.decimal  "cost",       :precision => 7, :scale => 2
    t.string   "fulart"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "d_no"
    t.decimal  "asum",       :precision => 9, :scale => 2
    t.date     "datago"
    t.date     "datastop"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts_providers", :force => true do |t|
    t.string   "art"
    t.decimal  "cost",        :precision => 7, :scale => 2
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts_purchases", :force => true do |t|
    t.string   "art"
    t.integer  "purchase_id"
    t.integer  "kol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", :force => true do |t|
    t.string   "p_org"
    t.string   "p_fio"
    t.string   "p_inn"
    t.string   "p_kpp"
    t.string   "p_adrur"
    t.string   "p_adrfiz"
    t.string   "p_rs"
    t.string   "p_bik"
    t.string   "p_tel"
    t.string   "p_bank"
    t.string   "p_ks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", :force => true do |t|
    t.string   "z_no"
    t.date     "datain"
    t.decimal  "asum",        :precision => 9, :scale => 2
    t.date     "datadone"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "readies", :force => true do |t|
    t.integer  "kol"
    t.integer  "sost"
    t.integer  "brak"
    t.integer  "order_id"
    t.integer  "description_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
