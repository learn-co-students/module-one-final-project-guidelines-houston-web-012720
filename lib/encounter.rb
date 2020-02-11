
require 'poke-api-v2'

module Encounter

    $current_pokemon = nil

    def random_encounter
      selection = Main.class_variable_get(:@@current_trainer).area.pokemon_list.split(", ").sample
      $current_pokemon = PokeApi.get(pokemon: selection)
      puts "A wild #{$current_pokemon.name} has appeared!"
    end

    def throw_pokeball
      if $current_pokemon
        puts "You throw a pokeball at the wild #{$current_pokemon.name}!"
      else
        puts "There is no pokemon to catch!"
        return
      end 

      chance_to_flee = rand(9)
      chance_to_catch = rand(9)

      if chance_to_catch > 6
        caught_pokeball
      else
        puts "You failed to catch the #{$current_pokemon.name}.."
        if chance_to_flee > 7
          pokemon_flee
        end  
      end    
       
    end

    def caught_pokeball
      puts "You caught the wild #{$current_pokemon.name}!"
    end

    def pokemon_flee
      puts "The wild #{$current_pokemon.name} has fled."
    end

end
