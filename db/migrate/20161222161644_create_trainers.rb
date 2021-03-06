class CreateTrainers < ActiveRecord::Migration[5.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.string :gender
      t.integer :level, :default => 1
      t.integer :experience, :default => 0
      t.integer :leading_pokemon_id
      t.integer :poke_tokens, :default => 20
      t.integer :last_token
      t.integer :training_pokemon_id
      t.integer :training_start
      t.integer :contest_pokemon_id
      t.integer :contest_start
      t.integer :daycare_pokemon_id
      t.integer :daycare_start

      t.timestamps
    end
  end
end
