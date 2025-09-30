class RemoveValorProdutoFromCarrinhos < ActiveRecord::Migration[8.0]
  def change
    remove_column :carrinhos, :valorProduto, :float
  end
end
