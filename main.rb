require_relative 'app'

def main
  app = App.new
  puts 'Welcome to School Library!'
  loop do
    puts "Please choose an option by entering a number\n1- List all books\n2- List all people\n3- Create a person
4- Create a book\n5- Create a rental\n6- List all rentals\n7- exit"
    num = gets.chomp.to_i
    break if app.start(num) == 'exit'
  end
end

main
