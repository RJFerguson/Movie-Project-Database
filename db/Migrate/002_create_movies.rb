class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :duration
      t.integer :gross
      t.string :plot_keywords
      t.float :score
      t.string :imdb_link
      t.integer :director_id
      t.integer :actor_id
      # t.integer :genre_id
    end
  end
end
