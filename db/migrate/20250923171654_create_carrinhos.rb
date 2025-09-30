class CreateCarrinhos < ActiveRecord::Migration[8.0]
  def change
    create_table :carrinhos do |t|
      t.text :produto
      t.float :valorProduto
      t.float :valorTotal
      t.integer :quantidadeProduto

      t.timestamps
    end
  end
end
