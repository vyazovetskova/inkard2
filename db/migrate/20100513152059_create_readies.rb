class CreateReadies < ActiveRecord::Migration
  def self.up
    create_table :readies do |t|
      t.column :kol, :integer
      t.column :sost, :integer
      t.column :brak, :integer
      t.column :order_id, :integer         #FK к таблице Orders
      t.column :description_id, :integer   #FK к таблице descriptions
      t.timestamps
    end
  end

  def self.down
    drop_table :readies
  end
end
