class CreateProdutos < ActiveRecord::Migration[8.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.float :preco
      t.references :categoria, null: false, foreign_key: true

      t.timestamps
    end
  end
end
