class UpdateJournalsColumnTypes < ActiveRecord::Migration[5.2]
  def change
    remove_column :journal_entries, :date_created, :datetime
    add_column :journal_entries, :created_at, :date
  end
end
