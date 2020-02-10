class PlaceTagAndJoiner < ActiveRecord::Migration[6.0]
  def change
    create_table places do |t|
      t.string :name
      t.float :distance
      t.string :category
      t.string :Address
      t.string :website
    end
    create_table tags do |t|
      t.string :title
      t.string :group
    end
    create_table place_tag_joiners do |t|
      t.integer :place_id
      t.integer :tag_id
    end
  
  end
end



