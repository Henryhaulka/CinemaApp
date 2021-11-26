class RemoveAvatarFromMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :avatar, :string
  end
end
