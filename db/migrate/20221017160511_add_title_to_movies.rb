class AddTitleToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :title, :text
  end
end
