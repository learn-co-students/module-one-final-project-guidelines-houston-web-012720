class AddMoodToJournalEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :journal_entries, :mood, :integer
  end
end
