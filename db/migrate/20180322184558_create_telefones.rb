class CreateTelefones < ActiveRecord::Migration[5.1]
  def change
    create_table :telefones do |t|
      t.integer :codigo_area
      t.string :numero
      t.string :tipo

      t.timestamps
    end
  end
end
