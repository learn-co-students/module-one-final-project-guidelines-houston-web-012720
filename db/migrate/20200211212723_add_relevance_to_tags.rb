class AddRelevanceToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :relevance, :integer
  end
end
