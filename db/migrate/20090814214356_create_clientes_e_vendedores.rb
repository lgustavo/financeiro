class CreateClientesEVendedores < ActiveRecord::Migration

  def self.up
    create_table :clientes do |t|
      t.string :nome, :null => false
    end

    create_table :vendedores do |t|
      t.string :nome, :null => false
    end
  end

  def self.down
    drop_table :clientes
    drop_table :vendedores
  end
  
end