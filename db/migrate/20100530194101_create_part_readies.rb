class CreatePartReadies < ActiveRecord::Migration
def self.up
 create_table :part_readies do |t|
   t.column :description_id, :integer
   t.column :part_id, :integer
   t.column :kol,    :integer
   t.column :art_part,   :string
   t.column :art_ready,   :string

   t.timestamps
 end
end

def self.down
 drop_table :part_readies
end
end