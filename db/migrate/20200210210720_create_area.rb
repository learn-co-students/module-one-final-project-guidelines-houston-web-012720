class CreateArea < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.integer :north_area_id
      t.integer :south_area_id
      t.integer :east_area_id
      t.integer :west_area_id
      t.string :pokemon_list
      t.string :water_list
    end
  end
end
