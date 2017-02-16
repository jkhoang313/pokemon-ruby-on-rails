class CreateBattles < ActiveRecord::Migration[5.0]
  def change
    create_table :battles do |t|
      t.integer :challenger_id
      t.integer :challenged_id

      t.timestamps
    end
  end
end
