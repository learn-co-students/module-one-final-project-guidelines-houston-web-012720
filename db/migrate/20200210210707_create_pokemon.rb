class CreatePokemon < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :trainer_id
      t.integer :area_id
    end
  end
end
