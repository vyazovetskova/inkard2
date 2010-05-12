class CreateCatalogs < ActiveRecord::Migration
  def self.up
    create_table :catalogs do |t|
      t.column :art, :string
      t.column :name, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :catalogs
  end
end
