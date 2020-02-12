class AddVisitedToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :visited, :boolean
  end
end
