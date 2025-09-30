class RemoveValorTotalFromCarrinhos < ActiveRecord::Migration[8.0]
  def change
    remove_column :carrinhos, :valorTotal, :float
  end
end
