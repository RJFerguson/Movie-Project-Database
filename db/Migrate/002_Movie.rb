class Movie < ActiveRecord::Migration
  def change
    create_table :Movies do |t|
      t.string :title
      t.integer :duration
      t.integer :gross
      t.string :plot_keywords
      t.integer :score
      t.string :imdb_link
      t.string :genre
      t.integer :actor1_id
      t.integer :actor2_id
      t.interger :actor3_id
      t.integer :director_id
      t.integer :genre_id
    end
  end
end
