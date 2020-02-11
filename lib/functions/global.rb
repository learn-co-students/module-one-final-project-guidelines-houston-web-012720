require_relative '../../config/environment'

$prompt = TTY::Prompt.new

def greeting
    username = $prompt.ask("What is your username?")
    puts "Welcome #{username}!"
end