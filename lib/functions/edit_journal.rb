require_relative 'global'

def choose_edit
    $prompt.select("What do you want to edit?") do |menu|
        menu.choice 'What did you learn?', -> {what_did_i_learn}
        menu.choice 'What was not clear?', -> {what_was_unclear}
        menu.choice 'How confident are you in the material?', -> {confidence_level}
        menu.choice 'How did you feel on the topic discussed?', -> {feelings_on_topic}
        menu.choice 'How do you personally feel today?', -> {feelings_general}
        menu.choice 'What is your mood?', -> {mood}
    end
end

def what_did_i_learn_1
    $current_journal.what_did_i_learn = $prompt.ask("What did you learn?")
end

def what_was_unclear_1
    $current_journal.what_was_unclear = $prompt.ask("What was not clear?")
end

def confidence_level_1
    $current_journal.confidence_level = $prompt.select("How confident are you in the material?", [1, 2, 3, 4, 5])
end

def feelings_on_topic_1
    $current_journal.feelings_on_topic = $prompt.ask("How did you feel on the topic discussed?")
end

def feelings_general_1
    $current_journal.feelings_general = $prompt.ask("How do you personally feel today?")
end

def mood_1
    $current_journal.mood = $prompt.select("What is your mood", [1, 2, 3, 4, 5])
end