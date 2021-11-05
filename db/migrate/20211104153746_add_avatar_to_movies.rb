class AddAvatarToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :avatar, :string
  end
end
