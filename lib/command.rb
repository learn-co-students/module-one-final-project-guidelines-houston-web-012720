module Command 
    @@prompt = TTY::Prompt.new



    def get_command
        @@prompt.ask(">: ")

    end

    def do_command(cmd)
        case cmd 
        when cmd == "go north"
            go_north
        end
        

    end

    def go_north
        

    end

    def go_south

    end

    def walk_in_grass

    end

    def release_pokemon

    end

    def list_pokemon

    end

    def where_am_i

    end





end