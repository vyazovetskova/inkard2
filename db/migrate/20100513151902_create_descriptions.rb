class CreateDescriptions < ActiveRecord::Migration
  def self.up
    create_table :descriptions do |t|
     
      t.column :dlina, :decimal, :precision =>3, :scale =>2
      t.column :color ,:string
      t.column :shin, :integer
      t.column :cost ,:decimal, :precision =>7, :scale =>2
      t.column :fulart ,:string
      t.column :catalog_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :descriptions
  end
end
