class Director < ActiveRecord::Migration
  def change
    create_table :Directors do |t|
      t.string :name
    end
  end
end
