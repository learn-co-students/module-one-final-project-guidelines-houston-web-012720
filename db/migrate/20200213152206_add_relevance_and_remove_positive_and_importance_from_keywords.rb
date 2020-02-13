class AddRelevanceAndRemovePositiveAndImportanceFromKeywords < ActiveRecord::Migration[5.2]
  def change
    add_column :keywords, :relevance, :integer
    remove_column :keywords, :importance
    remove_column :keywords, :positive?
  end
end
