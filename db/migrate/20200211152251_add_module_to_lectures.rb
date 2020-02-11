class AddModuleToLectures < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :module, :integer
  end
end
