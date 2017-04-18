class Actor < ActiveRecord::Migration
  def change
    create_table :Actors do |t|
      t.string :name
    end
  end
end
