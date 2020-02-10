class CreateKeywords < ActiveRecord::Migration[6.0]
    def change
      create_table :keywords do |t|
        t.string :keyword
        t.integer :importance #integer 1-10
        t.boolean :positive?
      end
    end
  end
