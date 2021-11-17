class AddFieldsToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :viewing_date, :datetime
    add_column :movies, :description, :text
  end
end
