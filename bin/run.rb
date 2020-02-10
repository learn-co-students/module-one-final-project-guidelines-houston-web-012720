require_relative '../config/environment'
# require_all

# class NewUser
#     attr_accessor :name, :password
#     def initialize(name)
#         @name = name 
#         @prompt = TTY::Prompt.new
#     end

#     def login 
#         puts "What is your password?"
#         pass = @prompt.mask("Password: ")
#         @password = pass
#         puts "Your pass is #{@password}"
#     end

#     def help

#         list = [
#                 "Update","Review","Restaurant_info"
#                 ]
#         input = @prompt.select("abc".light_blue,list)
#         case input
#         when list[0]
#             puts list[0]
#         when list[1]
#             puts list[1]
#         when list[2]
#             puts list[2]
#         end
#     end
#     def greeting
#         puts "greeting"
#         answer = gets.chomp
#         if answer == "help"
#             help
#             greeting
#         end
#     end
# end

# puts "Hello please put your name below "
# name = gets.chomp
# user = NewUser.new(name)
# puts "Hi #{name}"
# user.greeting
# user.login


