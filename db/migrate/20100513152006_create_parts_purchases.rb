class CreatePartsPurchases < ActiveRecord::Migration
  def self.up
    create_table :parts_purchases do |t|
      t.column :art, :string                             
      t.column :purchase_id, :integer                            #FK к таблице Закупки(purchases)
      t.column :kol, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :parts_purchases
  end
end
