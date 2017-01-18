class CreatePokedexTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :pokedex_types do |t|
      t.integer :type_id
      t.integer :pokedex_id

      t.timestamps
    end
  end
end
