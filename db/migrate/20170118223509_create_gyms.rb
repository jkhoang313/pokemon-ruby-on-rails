class CreateGyms < ActiveRecord::Migration[5.0]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :specialty
      t.integer :gym_leader_id
      t.integer :gym_pokemon_id
      t.integer :last_taken
      t.integer :challenger_id
      t.integer :challenger_pokemon_id
      t.integer :challenge_time
      t.integer :winner_id
      # add teams?
      # can aid your teammates gym?

      t.timestamps
    end
  end
end
