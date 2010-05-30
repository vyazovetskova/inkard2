class CreateParts < ActiveRecord::Migration
  def self.up
    create_table :parts do |t|
     t.column :art,    :string
      t.column :reserv, :integer
      t.column :brak,   :integer
      t.column :kol,    :integer
      t.column :name,   :string
      t.timestamps
    end
  end

  def self.down
    drop_table :parts
  end
end
