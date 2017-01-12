class CreateTrainers < ActiveRecord::Migration[5.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :password_digest
      t.string :age
      t.string :gender
      t.string :starter_pokemon
      #some special benefits for starter_pokemon
      t.integer :poke_tokens, :default => 5
      t.integer :last_token


      t.timestamps
    end
  end
end
