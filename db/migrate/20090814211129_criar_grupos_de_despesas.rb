class CriarGruposDeDespesas < ActiveRecord::Migration
  def self.up
    create_table :grupos_de_despesas do |t|
      t.string :nome, :null => false
    end
  end

  def self.down
    drop_table :grupos_de_despesas
  end
end
