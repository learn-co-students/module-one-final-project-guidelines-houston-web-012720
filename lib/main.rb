
require_relative './util.rb'

class Main
 
  extend Util
  extend Command
  extend Encounter

  # Declaring artii and tty-prompt gems
  @@artii = Artii::Base.new :font => 'doom' # Change font
  @@prompt = TTY::Prompt.new

  # Running begins as false and becomes true on run until finished
  running = false

  def self.run

    running = true

    Main.clear_term # Uses method from Util module

    Main.draw_title
    Main.draw_main_menu

    # Main game loop
    while running do
      Main.do_command(Main.get_command)
    end  

  end

  def self.draw_title
    pid = fork{ exec 'afplay', "res/Title_Screen.mp3" }
    puts @@artii.asciify("PokemonCli").colorize(:yellow) # Color font to blue and yellow
  end 

  def self.draw_main_menu
    # Uses tty-prompt to have the user make a selection
    choice = @@prompt.select('', 'New Game', 'Load Game', 'Exit')

    case choice
    when "New Game"
      Main.new_game
    when "Load Game"
      Main.load_game
    when "Exit"
      pid = fork{ exec 'killall', "afplay" }
      Main.exit_game
    end  

  end  

  def self.new_game
    Main.draw_intro
    Main.new_trainer
    Main.pick_starter
  end

  def self.load_game
    Main.clear_term
    username = @@prompt.ask("What is your name Trainer?: ".colorize(:green))
    user = Trainer.all.find { |t| t.name == username }

    if user
      @@current_trainer = user
      puts "Welcome back #{@@current_trainer.name}!"
    else
      puts "That is not a Trainer i've ever heard of!"
      sleep(2)
      Main.clear_term
      Main.draw_title
      Main.draw_main_menu
    end  

    pid = fork{ exec 'killall', "afplay" }

  end

  def self.exit_game
    Main.clear_term
    puts "Exiting...".colorize(:red)
    puts "Come back soon Trainer!".colorize(:green)
    exit
  end

  def self.draw_intro
    Main.clear_term

    puts

    # Uses slow_puts and halt method from Util module
    Main.slow_puts("Hello there! Welcome to the world of " + 
                   "POKEMON".colorize(:yellow) + "!"); Main.halt
    Main.slow_puts("My name is OAK! People call me the " + 
                   "POKEMON".colorize(:yellow) + " PROF!"); Main.halt
    Main.slow_puts("This world is inhabited by creatures called " + 
                   "POKEMON".colorize(:yellow) + "!"); Main.halt
    Main.slow_puts("For some people, " + "POKEMON".colorize(:yellow) + 
                   " are pets. Others use them for fights."); Main.halt
    Main.slow_puts("Myself...I study " + "POKEMON".colorize(:yellow) + 
                   " as a profession."); Main.halt 

    sleep(1.5)

  end  

  def self.new_trainer

    while true
      puts
      name = @@prompt.ask("First, what is your name?")

      if Trainer.all.find { |t| t.name == name }
        puts "That Trainer already exists!"
        sleep(1.5)
      else
        break
      end  
    end

    Main.clear_term
    Main.slow_puts("Right! So your name is #{name}!")

    Main.slow_puts("#{name}! Your very own " + "POKEMON".colorize(:yellow) + 
                   " legend is about to unfold!"); Main.halt
    Main.slow_puts("A world of dreams and adventures with " + 
                   "POKEMON".colorize(:yellow) + " awaits! Let's go!")   

    sleep(1.5) 

    @@current_trainer = Trainer.create(name: name, area_id: 1)

  end

  def self.pick_starter

    puts
    Main.slow_puts("Here, #{@@current_trainer.name}!" + 
                   " There are 3 " + "POKEMON".colorize(:yellow) + 
                   " here! They are inside the POKE BALLS."); Main.halt
    Main.slow_puts("When I was young, I was a serious " + 
                   "POKEMON".colorize(:yellow) + " trainer."); Main.halt
    Main.slow_puts("In my old age, I have only 3 left, but you can have one! Choose!"); Main.halt
    puts

    while true
      choice = @@prompt.select("", "Squirtle".colorize(:blue), 
                             "Bulbasaur".colorize(:green), 
                             "Charmander".colorize(:red))

      case choice
      when "Squirtle".colorize(:blue)
        puts
        if @@prompt.yes?("So you want the water " + 
                         "POKEMON".colorize(:yellow) + 
                         ", " + "Squirtle".colorize(:blue) + "?") 
          break
        else
          Main.clear_term  
        end

      when "Bulbasaur".colorize(:green)  
        puts
        if @@prompt.yes?("So you want the grass " + 
                         "POKEMON".colorize(:yellow) + 
                         ", " + "Bulbasaur".colorize(:green) + "?") 
          break
        else
          Main.clear_term
        end

      when "Charmander".colorize(:red)
        puts
        if @@prompt.yes?("So you want the fire " + 
                         "POKEMON".colorize(:yellow) + 
                         ", " + "Charmander".colorize(:red) + "?")
          break  
        else
          Main.clear_term
        end

      end
    end

    @@current_trainer.pokemons.create(name: choice.uncolorize.downcase)

    Main.slow_puts("This POKEMON looks really energetic!"); Main.halt
    Main.slow_puts("You'll need POKE BALLS to catch POKEMON"); Main.halt
    Main.slow_puts("So I will give you a few of mine!"); Main.halt

    @@current_trainer.update(pokeball: 10)
    puts
    puts "You recieved 10 POKE BALLS from PROF OAK!"
    puts
    sleep(1.5)

    pid = fork{ exec 'killall', "afplay" }

    help

  end

end  

