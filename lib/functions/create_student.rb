require_relative 'global'
require 'pry'

first_name = $prompt.ask("What is your first name?")
last_name = $prompt.ask("What is your last name?")
age = $prompt.ask("How old are you?")
gender = $prompt.ask("What is your gender?")
def username_is_unique(username)
    if Student.find_by(username: username)
        puts "Sorry, username '#{username}' is already taken, please try another."
        return false
    else
        puts "Username success"
        return true
    end
end
username = $prompt.ask("Please select a username")
until username_is_unique(username)
    username = $prompt.ask("Please select another username")
end
password = $prompt.mask("Create a password")
puts "Your password is #{password}"

# cohort_id = $prompt.ask("Select your cohort")

Student.create(username: username, password: password, first_name: first_name, last_name: last_name, age: age, gender: gender)

$current_student_id = Student.last.id
puts $current_student_id