module Command

    @@prompt = TTY::Prompt.new

    $in_battle = false

    def get_command
        @@prompt.ask(">: ")
    end

    def do_command(cmd)
        case cmd 
        when "go north"
            go_north
        when "go south"
            go_south   
        when "where am i"
            where_am_i   
        when "walk"
            Main.walk_in_grass
        when "throw pokeball"
            Main.throw_pokeball 
        when "list pokemon"
            list_pokemon    
        when "help"
            help   
        when "menu"
            menu    
        when "quit"
            Main.exit_game    
        else
            puts "That is not a valid command!"
            puts "Type 'help' to for a list of commands."
        end
    end

    def go_north
      return if in_battle_check
      
      if Main.class_variable_get(:@@current_trainer).area.north_area_id
        Main.class_variable_get(:@@current_trainer).area_id = 
          Main.class_variable_get(:@@current_trainer).area.north_area_id
        Main.class_variable_get(:@@current_trainer).save
      else
        puts "You can't go that way!"
        return
      end  
    end

    def go_south
      return if in_battle_check

      if Main.class_variable_get(:@@current_trainer).area.south_area_id
        Main.class_variable_get(:@@current_trainer).area_id = 
          Main.class_variable_get(:@@current_trainer).area.south_area_id
        Main.class_variable_get(:@@current_trainer).save
      else
        puts "You can't go that way!"
      end  
    end

    def walk_in_grass
      return if Main.class_variable_get(:@@current_trainer).area.pokemon_list == nil
      return if in_battle_check
      Main.random_encounter
    end

    def release_pokemon

    end

    def list_pokemon
      Main.class_variable_get(:@@current_trainer).pokemons.each do |p|
        puts p.name
      end  
    end

    def where_am_i
      place = Main.class_variable_get(:@@current_trainer).area.name
      puts "You are in #{place}."
    end

    def in_battle_check
      if $in_battle
        puts "You can't do that while you are in a battle!"
        return true
      else
        return false
      end  
    end 

    def help
      puts
      puts "- Commands -" 
      puts "go north - Goes north of your current location."
      puts "go south - Goes south of your current location."
      puts "walk - Walk in the tall grass to look for Pokemon."
      puts "menu - Opens a menu with more additional options."
      puts "quit - Quits the game."
      puts
    end  

    def menu
      puts
      puts "-MENU-----------------"
      choice = @@prompt.select("", "Pokemon", "Release Pokemon", "Quit")
      puts

      case choice
      when "Pokemon"
        list_pokemon
      when "Release Pokemon"
        release_pokemon
      when "Quit"
        Main.exit_game
      end

      puts

    end  

end
