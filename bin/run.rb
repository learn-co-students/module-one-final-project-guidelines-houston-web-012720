require_relative '../config/environment'

ActiveRecord::Base.logger.level = 1 # or Logger::INFO

# Run main game loop
Main.run
