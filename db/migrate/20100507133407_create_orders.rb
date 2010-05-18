class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.column :d_no, :string
      t.column :asum, :decimal, :precision =>9, :scale =>2
      t.column :datago, :date
      t.column :datastop, :date
      t.column :client_id, :integer #FK к таблице clients
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
