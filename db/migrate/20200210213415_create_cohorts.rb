class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :program_type
      t.date :start_date
      t.string :location
    end
  end
end
