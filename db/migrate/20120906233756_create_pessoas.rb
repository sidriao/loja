class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome, :null => false, :limit => 100
      t.string :cpf_cnpj, :null => false, :limit => 14
      t.integer :tipo, :null => false
      t.string :rg, :limit => 14
      t.string :cgf, :limit => 14
      t.date :data_nascimento
      t.string :sexo, :limit => 1
      t.string :naturalidade, :limit => 50
      t.string :fantasia, :limit => 100

      t.timestamps
    end
  end
end