class CreateAutorizations < ActiveRecord::Migration
  def self.up
    create_table :autorizations, :force => true do |t|
      t.column :login, :string
      t.column :password, :string

      t.timestamps
    end
  end

  def self.down
    drop_table :autorizations
  end
end
