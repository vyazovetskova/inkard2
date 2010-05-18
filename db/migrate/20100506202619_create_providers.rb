class CreateProviders < ActiveRecord::Migration
  def self.up
    create_table :providers do |t|
      t.column :p_org, :string
      t.column :p_fio, :string
      t.column :p_inn, :string
      t.column :p_kpp, :string
      t.column :p_adrur, :string
      t.column :p_adrfiz, :string
      t.column :p_rs, :string
      t.column :p_bik, :string
      t.column :p_tel, :string
      t.column :p_bank, :string
      t.column :p_ks, :string

      t.timestamps
    end
  end

  def self.down
    drop_table :providers
  end
end
