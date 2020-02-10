class CreatePage < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.integer :place_id
      t.string :url
    end
  end
end
