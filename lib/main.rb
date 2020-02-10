
class Main

  running = false

  def self.run

    running = true

    Main.draw_title
    Main.draw_main_menu

    while running do


      running = false  

    end  

  end

  def self.draw_title
    puts "Welcome To The World Of Pokemon!"
  end 

  def self.draw_main_menu
    # Draw menu
    # New Game
    # Load Game
    # Exit Game
  end  

  def self.new_game
    # Draw intro
    # Choose Name
    # Pick Pokemon
    # Play game
  end

  def self.load_game
  end

  def self.exit_game
    puts "Come back soon Trainer!"
    exit
  end

end  

