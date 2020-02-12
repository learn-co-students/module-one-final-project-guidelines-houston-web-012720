module Command

    @@prompt = TTY::Prompt.new

    $in_battle = false

    def trainer
      Main.class_variable_get(:@@current_trainer)
    end  

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
        when "flee"
            Main.flee    
        when "list pokemon"
            list_pokemon    
        when "get pokeballs"
            get_pokeballs    
        when "help"
            help   
        when "menu"
            menu    
        when "quit"
            Main.exit_game    
        when "release pokemon"  
            release_pokemon    
        else
            puts "That is not a valid command!"
            puts "Type 'help' to for a list of commands."
            Main.exit_game  
        end
    end

    def go_north
      return if in_battle_check
      
      if trainer.area.north_area_id
        trainer.area_id = trainer.area.north_area_id
        trainer.save
      else
        puts "You can't go that way!"
        return
      end  
    end

    def go_south
      return if in_battle_check

      if trainer.area.south_area_id
        trainer.area_id = trainer.area.south_area_id
        trainer.save
      else
        puts "You can't go that way!"
        return
      end  
    end

    def walk_in_grass
      return if trainer.area.pokemon_list == nil 
        return  if in_battle_check
      Main.random_encounter
      
    end

    def get_pokeballs
      if trainer.area_id == 1
        puts "PROF OAK gives you 5 POKE BALLS!"
        trainer.pokeball += 5
        trainer.save
      else
        puts "You need to be in PALLET TOWN to get more!"
      end  
    end  

    def release_pokemon
      ans = @@prompt.ask("which pokemon would you like to release?")
      rp = trainer.pokemons.find {|p| p.name == ans}
        if rp.delete
          puts "Pokemon deleted!"
          trainer.save
          trainer.reload
        else 
          puts "No pokemon"
        end
    end

    def list_pokemon
      trainer.pokemons.each do |p|
        puts p.name
      end  
    end

    def where_am_i
      place = trainer.area.name
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
      choice = @@prompt.select("", "Pokemon", "Release Pokemon", "Quit", "Items")
      puts

      case choice
      when "Pokemon"
        pokemon_info
      when "Release Pokemon"
        release_pokemon
      when "Items"
        puts "Pokeballs: #{trainer.pokeball}"  
      when "Quit"
        Main.exit_game
      end

      puts

    end  

end
