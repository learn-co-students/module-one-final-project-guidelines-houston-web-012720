class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.float :distance
      t.string :category
      t.string :Address
      t.string :website
    end
  end
end
