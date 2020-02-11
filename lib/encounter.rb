
require 'poke-api-v2'

module Encounter

    def random_encounter
      selection = Main.class_variable_get(:@@current_trainer).area.pokemon_list.split(", ").sample
      pokemon = PokeApi.get(pokemon: selection)
      puts pokemon.name
    end

    def throw_pokeball

    end

    def caught_pokeball

    end

    def pokemon_flee

    end

end
