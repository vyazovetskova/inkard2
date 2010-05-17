class AddCatalodidToDescription < ActiveRecord::Migration
  def self.up
    add_column :descriptions, :catalog_id, :integer
    remove_column :descriptions, :catalod_id
  end

  def self.down
   raise ActiveRecord::IrreversibleMigration
  end
end

