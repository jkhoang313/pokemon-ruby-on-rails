class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.integer :gym_id
      t.integer :gym_leader_id
      t.integer :gym_pokemon_id
      t.integer :challenger_id
      t.integer :challenger_pokemon_id
      t.integer :challenge_time
      t.integer :winner_id
      t.boolean :over, default: false

      t.timestamps
    end
  end
end
