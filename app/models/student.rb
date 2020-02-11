class Student < ActiveRecord::Base
    belongs_to :cohort
    has_many :journal_entries
    has_many :lectures, through :journal_entries

    def greeting
        p "Welcome #{username}!"
    end

    def user_info
        username = $prompt.ask('What is your name?', deafult: ENV['USER'])
        password = $prompt.mask("What is your password?")
        p "Hi #{username}! Your password is #{password}."
    end
end