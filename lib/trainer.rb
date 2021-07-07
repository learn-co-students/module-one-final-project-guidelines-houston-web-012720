class Trainer < ActiveRecord::Base
    belongs_to :area
    has_many :pokemons
    has_many :areas, through: :pokemons 
end
