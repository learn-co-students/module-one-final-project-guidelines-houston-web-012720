
require_relative './util.rb'

class Main
 
  extend Util

  @@artii = Artii::Base.new :font => 'doom' # Change font
  @@prompt = TTY::Prompt.new

  running = false

  def self.run

    running = true

    Main.clear_term

    Main.draw_title
    Main.draw_main_menu

    while running do



      running = false  

    end  

  end

  def self.draw_title
    puts @@artii.asciify("PokeCli") # Color font to blue and yellow
  end 

  def self.draw_main_menu
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
  end

  def self.exit_game
    Main.clear_term
    puts "Exiting..."
    puts "Come back soon Trainer!"
    exit
  end

  def self.draw_intro
    Main.clear_term
    Main.slow_puts("Hello there! Welcome to the world of POKEMON!"); Main.halt
    Main.slow_puts("My name is OAK! People call me the POKEMON PROF!"); Main.halt
    Main.slow_puts("This world is inhabited by creatures called POKEMON!"); Main.halt
    Main.slow_puts("For some people, POKEMON are pets. Others use them for fights."); Main.halt
    Main.slow_puts("Myself...I study POKEMON as a profession."); Main.halt 
  end  

  def self.new_trainer
    puts
    name = @@prompt.ask("First, what is your name?")
  end

end  

