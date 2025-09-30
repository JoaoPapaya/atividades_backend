class AddSenhaToUsuarios < ActiveRecord::Migration[8.0]
  def change
    add_column :usuarios, :senha, :string
  end
end
