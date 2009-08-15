class CriarDuplicatasAReceber < ActiveRecord::Migration
  def self.up

    create_table :duplicatas_a_receber do |t|
      t.integer :pedido_id
      t.integer :cliente_id, :null => false
      t.integer :lancamento_id
      t.integer :plano_de_contas_id, :null => false
      t.string :tipo_de_cobranca, :null => false
      t.integer :agencia_id
      t.string :cheque
      t.string :serie_do_cheque
      t.string :cheque_nominal_a
      t.integer :vendedor_id
      t.date :data_de_emissao, :null => false
      t.date :data_de_vencimento, :null => false
      t.decimal :valor, :precision => 12, :scale => 2, :null => false
      t.timestamps
    end

  end

  def self.down

    drop_table :duplicatas_a_receber

  end
end
