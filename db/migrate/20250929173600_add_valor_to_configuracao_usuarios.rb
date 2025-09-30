class AddValorToConfiguracaoUsuarios < ActiveRecord::Migration[8.0]
  def change
    add_column :configuracao_usuarios, :valor, :string
  end
end
