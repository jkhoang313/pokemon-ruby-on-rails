class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.integer :gym_id
      t.string :gym_leader
      t.string :gym_pokemon
      t.string :challenger
      t.string :challenger_pokemon
      t.string :winner
      # deleting pokemon after challenge will mess using id?

      t.timestamps
    end
  end
end
