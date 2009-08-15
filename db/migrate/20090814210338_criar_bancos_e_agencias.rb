class CriarBancosEAgencias < ActiveRecord::Migration

  def self.up
    create_table :bancos do |t|
      t.integer :codigo, :null => false
      t.string :nome, :null => false
    end

    create_table :agencias do |t|
      t.integer :banco_id, :null => false
      t.integer :codigo, :null => false
      t.string :nome, :null => false
    end
  end

  def self.down
    drop_table :bancos
    drop_table :agencias
  end
  
end
