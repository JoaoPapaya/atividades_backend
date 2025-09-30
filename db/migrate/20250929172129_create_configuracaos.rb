class CreateConfiguracaos < ActiveRecord::Migration[8.0]
  def change
    create_table :configuracaos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
