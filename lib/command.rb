module Command

    @@prompt = TTY::Prompt.new

    $in_battle = false

    def trainer
      Main.class_variable_get(:@@current_trainer)
    end  

    def get_command
      while $in_battle
        battle_menu
      end

      puts "Press 'h' for a list of commands.".light_black

      @@prompt.keypress("#{trainer.name} ".yellow.bold + "$".cyan.bold)

    end

    def do_command(cmd)

        Main.clear_term

        case cmd 
        when "\e[A"
            move("north")
        when "\e[B"  
            move("south")    
        when "\e[C" 
            move("east") 
        when "\e[D"
            move("west")  
        when "\t"
            where_am_i   
        when "w"
            walk_in_grass
        when "f"
            fish    
        when "g"
            get_pokeballs    
        when "h"
            help    
        when "\e"
          menu 
        when "Q"
            Main.exit_game    
        else
          puts "That is not a valid command!".colorize(:red)
        end

    end

    def move(direction)
      return if in_battle_check

      err_msg = "You can't go that way!".red.bold

      if direction == "north"
        trainer.area.north_area_id ? (trainer.area_id = trainer.area.north_area_id) : (puts err_msg)
      elsif direction == "south"
        trainer.area.south_area_id ? (trainer.area_id = trainer.area.south_area_id) : (puts err_msg)
      elsif direction == "east"
        trainer.area.east_area_id ? (trainer.area_id = trainer.area.east_area_id) : (puts err_msg)
      elsif direction == "west"
        trainer.area.west_area_id ? (trainer.area_id = trainer.area.west_area_id) : (puts err_msg)
      end  

      trainer.save
      where_am_i

    end  

    def walk_in_grass
      if trainer.area.pokemon_list == nil
        puts "There are no Pokemon here!".red.bold
      else  
        return  if in_battle_check
        Main.random_encounter
      end  
    end

    def fish
      if trainer.area.water_list == nil
        puts "You can't fish for Pokemon here!".red.bold
      else
        return if in_battle_check
        Main.random_water_encounter
      end  
    end

    def get_pokeballs
      if trainer.area_id == 1
        puts "PROF OAK gives you 5 POKE BALLS!".colorize(:green)
        trainer.pokeball += 5
        trainer.save
      else
        puts "You need to be in PALLET TOWN to get more!".colorize(:red)
      end  
    end  

    def release_pokemon
      list_pokemon
      puts "Enter 'back' to go back".light_black
      ans = @@prompt.ask("Which Pokemon would you like to release?")
      if ans == "back"
        return
      else  
        if found_pokemon = trainer.pokemons.find {|p| p.name == ans}
          found_pokemon.delete
          puts "You released your #{ans}...".colorize(:blue)
          trainer.save
          trainer.reload
        else 
          puts "You do not have a #{ans}!".colorize(:red)
        end
      end  
    end

    def list_pokemon
      puts
      trainer.pokemons.each do |p|
        $current_pokemon = PokeApi.get(pokemon: p.name)
        Main.color_by_type
        puts "Pokemon: " + "#{$current_pokemon.name}".colorize($type_color)
        puts "  - Height: #{$current_pokemon.height}"
        puts "  - Weight: #{$current_pokemon.weight}"
        puts
      end  
    end

    def where_am_i
      place = trainer.area.name
      puts "You are in #{place}."
    end

    def in_battle_check
      if $in_battle
        puts "You can't do that while you are in a battle!".colorize(:red)
        return true
      else
        return false
      end  
    end 

    def pokemon_info
      trainer.pokemons.each do |p|
        poke = PokeApi.get(pokemon: p.name)
        puts p.name
        puts "height: #{poke.height}"
        puts  "weight: #{poke.weight}"
        puts 
      end
    end



    def help
      puts
      puts "- Commands -" 
      puts "Up Arrow - Goes north of your current location."
      puts "Down Arrow - Goes south of your current location."
      puts "w - Walk in the tall grass to look for Pokemon. (does not work in towns)"
      puts "Esc - Opens a menu with additional options."
      puts "Tab - Tells you where you are!"
      puts "g - Gets more pokeballs from Prof Oak! (only works in Pallet Town)"
      puts "h - Shows a list of commands"
      puts "Q - Quits the game."
      puts 
      puts
    end  

    def menu
      puts
      puts "-MENU-----------------"
      choice = @@prompt.select("", "Pokemon".colorize(:yellow), 
                               "Release Pokemon".colorize(:red), 
                               "Items".colorize(:green), 
                               "Close Menu".colorize(:red))
      puts

      case choice
      when "Pokemon".colorize(:yellow)
        list_pokemon
      when "Release Pokemon".colorize(:red)
        release_pokemon
      when "Items".colorize(:green)
        puts "Pokeballs: #{trainer.pokeball}"  
      when "Close Menu".colorize(:red)
        return
      end

      puts

    end  

end
