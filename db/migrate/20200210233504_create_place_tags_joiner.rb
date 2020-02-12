class CreatePlaceTagsJoiner < ActiveRecord::Migration[5.2]
  def change
    create_table :place_tag_joiners do |t|
      t.integer :place_id
      t.integer :tag_id
    end
  end
end
