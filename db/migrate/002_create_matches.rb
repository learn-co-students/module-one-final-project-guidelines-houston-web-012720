class CreateMatches < ActiveRecord::Migration[6.0]
    def change
      create_table :matches do |t|
        t.integer :page_id
        t.integer :keyword_id
        t.integer :count
      end
    end
  end
