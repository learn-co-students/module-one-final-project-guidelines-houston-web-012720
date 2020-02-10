class Trainer < ActiveRecord::Base
    belongs_to :areas
    has_many :pokemons
    has_many :areas, through: :pokemons 
end