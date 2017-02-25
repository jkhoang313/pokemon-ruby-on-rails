class AddAvatarToTrainers < ActiveRecord::Migration[5.0]
  def change
    add_column :trainers, :avatar, :string
  end
end
