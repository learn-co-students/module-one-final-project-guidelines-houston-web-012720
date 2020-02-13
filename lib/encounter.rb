
require 'poke-api-v2'

module Encounter

    @@prompt = TTY::Prompt.new

    $current_pokemon = nil
    $type_color = :white

    def color_by_type
      case $current_pokemon.types[0].type.name
      when "fire"
        $type_color = :red
      when "water"  
        $type_color = :blue
      when "grass"  
        $type_color = :green
      when "rock"  
        $type_color = :magenta
      when "flying"  
        $type_color = :white
      when "psychic"  
        $type_color = :magenta
      when "dark"  
        $type_color = :light_black
      when "steel"  
        $type_color = :white
      when "ice"  
        $type_color = :light_cyan
      when "fairy"  
        $type_color = :light_magenta
      when "ghost"  
        $type_color = :magenta
      when "ground"  
        $type_color = :light_black
      when "poison"  
        $type_color = :light_magenta
      when "bug"  
        $type_color = :light_green
      when "electric"  
        $type_color = :light_yellow
      when "dragon"  
        $type_color = :light_red
      when "fighting"  
        $type_color = :light_cyan
      else
        $type_color = :white  
      end 

      $type_color
    end

    def random_encounter
      selection = Main.class_variable_get(:@@current_trainer).area.pokemon_list.split(", ").sample
      $current_pokemon = PokeApi.get(pokemon: selection)
      color_by_type
      puts "A wild " + "#{$current_pokemon.name}".colorize($type_color) + " has appeared!"
      $in_battle = true
    end

    def throw_pokeball
      if $current_pokemon
        color_by_type
        if trainer.pokeball > 0
          puts "You throw a pokeball at the wild #{$current_pokemon.name}!"
          puts
          trainer.pokeball -= 1
          trainer.save
          
          3.times do
            sleep(1)
            puts "*wobble*"
          end  
          
        else
          puts "You have run out of Pokeballs!"
          return
        end 

      else
        puts "There is no pokemon to catch!"
        return
      end 

      chance_to_flee = rand(9)
      chance_to_catch = rand(9)

      if chance_to_catch > 3
        caught_pokeball
      else
        sleep(1)
        puts "You failed to catch the #{$current_pokemon.name}.."
        sleep(2)
        if chance_to_flee > 7
          pokemon_flee
        end  
      end    
       
    end

    def flee
      $in_battle = false
      $current_pokemon = nil
      puts "You flee from the battle!"
      sleep(1)
      Main.clear_term
    end  

    def caught_pokeball
      sleep(1)
      puts "*click*"
      sleep(1)
      Main.clear_term
      puts "************************************"
      puts "You caught the wild #{$current_pokemon.name}!"
      puts "************************************"
      Main.class_variable_get(:@@current_trainer).pokemons.create(name: $current_pokemon.name)
      sleep(2)
      $current_pokemon = nil
      $in_battle = false
    end

    def pokemon_flee
      puts "The wild #{$current_pokemon.name} has fled."
      sleep(2)
      $current_pokemon = nil
      $in_battle = false
    end

    def battle_menu
      puts
     
      color_by_type
      puts "You are facing a wild " + 
           "#{$current_pokemon.name}".colorize($type_color) +
           "!"

      puts

      puts "-Battle-----------------"
      choice = @@prompt.select("", "Throw Pokeball".colorize(:yellow), 
                               "Items".colorize(:green), 
                               "Flee".colorize(:red))
      puts

      case choice
      when "Throw Pokeball".colorize(:yellow)
        throw_pokeball
      when "Items".colorize(:green)
        puts "Pokeballs: #{trainer.pokeball}" 
        sleep(2)
      when "Flee".colorize(:red)
        flee
      end

      puts

      Main.clear_term

    end  
end
