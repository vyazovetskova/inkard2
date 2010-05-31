# To change this template, choose Tools | Templates
# and open the template in the editor.

class AddPartidToPartsPurchase < ActiveRecord::Migration
  def self.up
    add_column :parts_purchases, :part_id, :integer
  end

  def self.down
   raise ActiveRecord::IrreversibleMigration
  end
end
