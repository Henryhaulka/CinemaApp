class AddCapacityToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :capacity, :integer, default: 500
  end
end
