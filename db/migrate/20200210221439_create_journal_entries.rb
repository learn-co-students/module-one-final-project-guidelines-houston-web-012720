class CreateJournalEntries < ActiveRecord::Migration[6.0]
  def change
    create_table do |t|
      t.integer :student_id
      t.integer :lecture_id
      t.created_at
      t.string :what_did_I_learn
      t.string :what_was_unclear
      t.integer :confidence_level
      t.text :feelings_on_topic
      t.text :feelings_general
    end
  end
end
