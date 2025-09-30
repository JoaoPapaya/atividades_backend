class RemoveProdutoFromCarrinhos < ActiveRecord::Migration[8.0]
  def change
    remove_column :carrinhos, :produto, :text
  end
end
