class Area < ActiveRecord::Base
    has_many :trainers
    has_many :pokemons
    has_many :trainers, through: :pokemons
end
