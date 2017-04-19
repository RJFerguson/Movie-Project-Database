class CreateMoviegenres < ActiveRecord::Migration
  def change
    create_table :moviegenres do |t|
      t.integer :movie_id
      t.integer :genre_id
    end
  end
end
