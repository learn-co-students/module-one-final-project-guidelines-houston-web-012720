class CreateStudents < ActiveRecord::Migration[5.2]
     def change
     create_table :students do |t|
          t.string :username
          t.string :password
          t.string :first_name
          t.string :last_name
          t.integer :age
          t.string :gender
          t.integer :cohort_id
          end
     end
end
