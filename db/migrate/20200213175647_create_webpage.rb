class CreateWebpage < ActiveRecord::Migration[5.2]
  def change
    create_table :webpages do |t|
      t.string :domain
      t.string :page
      t.text :content
      t.boolean :visited
    end
  end
end
