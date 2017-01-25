class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.integer :trainer_id
      t.integer :pokedex_id
      t.string :name
      t.integer :level, :default => 1
      t.integer :experience, :default => 0
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed
      t.boolean :occupied, default: :false
      t.string :group

      t.timestamps
    end
  end
end
