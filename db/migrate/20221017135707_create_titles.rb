class CreateTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :titles do |t|
      t.string :overview
      t.string :poster_url
      t.float :rating

      t.timestamps
    end
  end
end
