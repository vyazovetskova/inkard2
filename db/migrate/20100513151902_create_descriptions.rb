class CreateDescriptions < ActiveRecord::Migration
  def self.up
    create_table :descriptions do |t|
      t.column :catalod_id, :integer
      t.column :dlina, :decimal, :precision =>3, :scale =>2
      t.column :color ,:string
      t.column :shin, :integer
      t.column :cost ,:decimal, :precision =>7, :scale =>2
      t.column :fulart ,:string
      t.timestamps
    end
  end

  def self.down
    drop_table :descriptions
  end
end
