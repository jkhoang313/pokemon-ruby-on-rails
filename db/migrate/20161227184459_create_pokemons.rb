class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.integer :trainer_id
      t.integer :pokedex_id
      t.string :name
      t.integer :level, :default => 1
      t.integer :experience, :default => 0
      # add feature
      t.string :hp
      t.string :attack
      t.string :defense
      t.string :special_attack
      t.string :special_defense
      t.string :speed
      t.boolean :occupied, default: :false
      t.string :group
      # add nickname

      t.timestamps
    end
  end
end
