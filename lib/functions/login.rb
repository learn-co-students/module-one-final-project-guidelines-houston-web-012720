require_relative 'global'

def user_info
    username = $prompt.ask('What is your name?', deafult: ENV['USER'])
    password = $prompt.mask("What is your password?")
    p "Hi #{username}! Your password is #{password}."
end

greeting