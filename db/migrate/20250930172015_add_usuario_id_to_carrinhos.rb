class AddUsuarioIdToCarrinhos < ActiveRecord::Migration[8.0]
  def change
    add_reference :carrinhos, :usuario, null: false, foreign_key: true
  end
end
