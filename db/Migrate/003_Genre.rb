class Genre < ActiveRecord::Migration
  def change
    create_table :Genres do |t|
      t.string :name
    end
  end
end
