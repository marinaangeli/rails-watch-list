class RenameTitlesToMovies < ActiveRecord::Migration[7.0]
  def change
    rename_table :titles, :movies
  end
end
