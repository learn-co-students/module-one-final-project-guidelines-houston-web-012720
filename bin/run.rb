require_relative '../config/environment'
# require_relative '../lib/functions/login.rb'
# require_relative '../lib/functions/global_id_test.rb'

puts "Welcome to Gaal_Williams Code Camp!"
def main_menu
    $prompt.select("Select an option below") do |menu|
    menu.choice "Log in", -> {login}
    menu.choice "Create new student account", -> {create_student}
    # menu.choice "Hang out for a bit", -> {hang_out(0.5,5)}
    end
end

if main_menu == false
    main_menu
end    

puts $current_student_id

def inner_menu
    $prompt.select("What would you like to do?") do |menu|
        menu.choice "Look at my journal entries", -> {student_journal_list}
        menu.choice "Create a new journal entry", -> {create_entry}
        menu.choice "Log out", -> {main_menu}
    end
end

inner_menu

if inner_menu == false
    main_menu
end
