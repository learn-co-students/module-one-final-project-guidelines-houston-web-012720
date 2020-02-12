class AddPokeball < ActiveRecord::Migration[5.2]
  def change
    add_column :trainers, :Pokeball, :integer
  end
end
