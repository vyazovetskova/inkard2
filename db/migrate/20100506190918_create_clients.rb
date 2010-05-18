class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.column :cl_org, :string
      t.column :cl_fio, :string
      t.column :cl_inn, :string
      t.column :cl_kpp, :string
      t.column :cl_adrur, :string
      t.column :cl_adrfiz, :string
      t.column :cl_rs, :string
      t.column :cl_bik, :string
      t.column :cl_tel, :string
      t.column :cl_bank, :string
      t.column :cl_ks, :string

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
