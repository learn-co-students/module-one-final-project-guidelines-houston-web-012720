
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
    puts @@artii.asciify("PokeCli") # Color font to blue and yellow
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
      Main.exit_game
    end  

  end  

  def self.new_game
    Main.draw_intro
    Main.new_trainer
  end

  def self.load_game
    Main.clear_term
    username = @@prompt.ask("What is your name Trainer?: ")
    user = Trainer.all.find { |t| t.name == username }

    if user
      @@current_trainer = user
      puts "Welcome back #{@@current_trainer.name}!"
    else
      puts "That is not a Trainer i've ever heard of!"
      exit 
    end  
  end

  def self.exit_game
    Main.clear_term
    puts "Exiting..."
    puts "Come back soon Trainer!"
    exit
  end

  def self.draw_intro
    Main.clear_term

    # Uses slow_puts and halt method from Util module
    Main.slow_puts("Hello there! Welcome to the world of POKEMON!"); Main.halt
    Main.slow_puts("My name is OAK! People call me the POKEMON PROF!"); Main.halt
    Main.slow_puts("This world is inhabited by creatures called POKEMON!"); Main.halt
    Main.slow_puts("For some people, POKEMON are pets. Others use them for fights."); Main.halt
    Main.slow_puts("Myself...I study POKEMON as a profession."); Main.halt 

  end  

  def self.new_trainer

    puts
    name = @@prompt.ask("First, what is your name?")

    Main.clear_term
    Main.slow_puts("Right! So your name is #{name}!")

    Main.slow_puts("#{name}! Your very own POKEMON legend is about to unfold!"); Main.halt
    Main.slow_puts("A world of dreams and adventures with POKEMON awaits! Let's go!")    
    sleep(2) 

    @@current_trainer = Trainer.create(name: name, area_id: 1)

  end

end  

