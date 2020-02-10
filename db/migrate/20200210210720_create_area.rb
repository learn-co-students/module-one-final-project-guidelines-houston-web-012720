class CreateArea < ActiveRecord::Migration[5.1]
  def change
    create_table do |t|
      t.string :name
      t.integer :north_area_id
      t.integer :south_area_id
  end
end
