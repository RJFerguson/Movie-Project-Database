class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :duration
      t.integer :gross
      t.string :plot_keywords
      t.integer :score
      t.string :imdb_link
    end
  end
end
