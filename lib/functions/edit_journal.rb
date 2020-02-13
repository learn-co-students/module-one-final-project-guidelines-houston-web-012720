require_relative 'global'

# $current_journal_id = 4

def choose_edit
    $prompt.select("What do you want to edit?") do |menu|
        menu.choice 'What did you learn?', -> {what_did_i_learn_1}
        menu.choice 'What was not clear?', -> {what_was_unclear_1}
        menu.choice 'How confident are you in the material?', -> {confidence_level_1}
        menu.choice 'How did you feel on the topic discussed?', -> {feelings_on_topic_1}
        menu.choice 'How do you personally feel today?', -> {feelings_general_1}
        menu.choice 'What is your mood?', -> {mood_1}
    end
end

def what_did_i_learn_1
    $current_journal.what_did_i_learn = $prompt.ask("What did you learn?")
    $current_journal.save
end

def what_was_unclear_1
    $current_journal.what_was_unclear = $prompt.ask("What was not clear?")
    $current_journal.save
end

def confidence_level_1
    $current_journal.confidence_level = $prompt.select("How confident are you in the material?", [1, 2, 3, 4, 5])
    $current_journal.save
end

def feelings_on_topic_1
    $current_journal.feelings_on_topic = $prompt.ask("How did you feel on the topic discussed?")
    $current_journal.save
end

def feelings_general_1
    $current_journal.feelings_general = $prompt.ask("How do you personally feel today?")
        $current_journal.save
end

def mood_1
    $current_journal.mood = $prompt.select("What is your mood", [1, 2, 3, 4, 5])
    $current_journal.save
end
# choose_edit
# binding.pry

0