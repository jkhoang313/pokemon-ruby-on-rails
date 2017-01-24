class CreateTypeWeaknesses < ActiveRecord::Migration[5.0]
  def change
    create_table :type_weaknesses do |t|
      t.integer :type_id
      t.integer :weakness_id

      t.timestamps
    end
  end
end
