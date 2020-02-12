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
        when "list pokemon"
            list_pokemon    
        when "quit"
            Main.exit_game  
        when "release pokemon"  
            release_pokemon
        end
    end

    def go_north
      return if in_battle_check
      trainer.area_id = 
        trainer.area.north_area_id
      trainer.save
    end

    def go_south
      return if in_battle_check
      trainer.area_id = 
      trainer.area.south_area_id
      trainer.save
    end

    def walk_in_grass
      return if trainer.area.pokemon_list == nil 
        return  if in_battle_check
      Main.random_encounter
      
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

end
