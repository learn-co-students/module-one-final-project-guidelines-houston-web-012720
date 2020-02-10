class CreateLectures < ActiveRecord::Migration[5.2]
    def change
        create_table :lectures do |t|
            t.string :name
            t.date :date
            t.string :teacher
        end
    end
end
