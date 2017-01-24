class CreateTypeStrengths < ActiveRecord::Migration[5.0]
  def change
    create_table :type_strengths do |t|
      t.integer :type_id
      t.integer :strength_id

      t.timestamps
    end
  end
end
