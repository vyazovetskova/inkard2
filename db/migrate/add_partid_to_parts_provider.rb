class AddPartidToPartsProvider < ActiveRecord::Migration
 def self.up
    add_column :parts_providers, :part_id, :integer
  end

  def self.down
   raise ActiveRecord::IrreversibleMigration
  end
end
