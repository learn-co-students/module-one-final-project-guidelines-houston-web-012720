class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.float :distance
      t.string :category
      t.string :address
      t.string :website
    end
  end
end
