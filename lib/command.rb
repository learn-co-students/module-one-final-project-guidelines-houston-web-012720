module Command

    @@prompt = TTY::Prompt.new

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
        when "quit"
            Main.exit_game    
        end
    end

    def go_north
      Main.class_variable_get(:@@current_trainer).area_id = 
        Main.class_variable_get(:@@current_trainer).area.north_area_id
    end

    def go_south
      Main.class_variable_get(:@@current_trainer).area_id = 
        Main.class_variable_get(:@@current_trainer).area.south_area_id
    end

    def walk_in_grass
      Main.random_encounter
    end

    def release_pokemon

    end

    def list_pokemon

    end

    def where_am_i
      place = Main.class_variable_get(:@@current_trainer).area.name
      puts "You are in #{place}."
    end

end
