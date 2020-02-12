class CreateKeywords < ActiveRecord::Migration[5.2]
    def change
      create_table :keywords do |t|
        t.string :keyword
        t.integer :importance #integer 1-10
        t.boolean :positive?
      end
    end
  end
