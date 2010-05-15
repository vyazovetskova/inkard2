class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.column :z_no, :string
      t.column :datain, :date
      t.column :asum, :decimal, :precision =>9, :scale =>2
      t.column :datadone, :date
      t.column :provider_id, :integer #FK к таблице providers
      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
