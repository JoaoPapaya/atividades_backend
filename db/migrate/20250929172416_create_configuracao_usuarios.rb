class CreateConfiguracaoUsuarios < ActiveRecord::Migration[8.0]
  def change
    create_table :configuracao_usuarios do |t|
      t.references :usuario, null: false, foreign_key: true
      t.references :configuracao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
