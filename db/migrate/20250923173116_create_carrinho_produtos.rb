class CreateCarrinhoProdutos < ActiveRecord::Migration[8.0]
  def change
    create_table :carrinho_produtos do |t|
      t.references :carrinho, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
