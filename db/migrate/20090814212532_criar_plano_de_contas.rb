class CriarPlanoDeContas < ActiveRecord::Migration
  def self.up
    create_table :plano_de_contas do |t|
      t.string :nome, :null => false
      t.string :tipo, :null => false
      t.boolean :habilitado, :default => true
      t.integer :banco_id, :null => false
      t.integer :grupo_de_despesa_id, :null => false
    end
  end

  def self.down
    drop_table :plano_de_contas
  end
end
