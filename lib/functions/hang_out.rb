require_relative 'global'

def hang_out(sec, times)
    i = 0
    puts "Hanging out for a bit"
    while i < times  do
        puts "-"
        sleep(sec)
        i +=1
    end
end