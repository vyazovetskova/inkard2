class CreatePartsProviders < ActiveRecord::Migration
  def self.up
    create_table :parts_providers do |t|
      t.column :art, :string                            
      t.column :cost ,:decimal, :precision =>7, :scale =>2
      t.column :provider_id, :integer                    #FK к таблице Поставщики(providers)
      t.timestamps
    end
  end

  def self.down
    drop_table :parts_providers
  end
end
