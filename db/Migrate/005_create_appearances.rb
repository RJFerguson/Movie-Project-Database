class CreateAppearances < ActiveRecord::Migration
  def change
    create_table :appearances do |t|
      t.integer :actor_id 
      t.integer :movie_id 
    end
  end
end
