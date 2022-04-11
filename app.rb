require_relative 'book'
require_relative 'rental'
require_relative 'people'
require_relative 'printer'
require_relative 'bookcreator'

class App
  def initialize
    @books = BookList.new
    @people = People.new
  end

  def start
    puts 'Welcome to School Library!'
    menu
  end

  private

  def menu
    loop do
      puts "Please choose an option by entering a number\n1- List all books\n2- List all people\n3- Create a person
4- Create a book\n5- Create a rental\n6- List all rentals\n7- exit"
      num = gets.chomp.to_i
      case num.to_i
      when 1 then ListPrinter.print_list(@books.list)
      when 2 then ListPrinter.print_list(@people.list)
      when 3 then add_person
      when 4 then @books.add_book
      when 5 then create_rental
      when 6 then list_rentals
      when 7 then break
      end
    end
  end

  def add_person
    input = ''
    until input.to_i.positive? && input.to_i < 3
      puts 'Do you want to create a student(1) or a teacher(2)?[input the number]'
      input = gets.chomp
      @people.add_person(input == '1' ? CreateStudent.new : CreateTeacher.new)
    end
    @num = 0
  end

  def create_rental
    book_index = -1
    person_index = -1
    puts 'select a book from the following list by number'
    ListPrinter.print_list(@books.list)
    until book_index > -1 && book_index < @books.list.length
      puts 'book index:'
      book_index = gets.chomp.to_i
    end
    puts 'select a person from the following list by number'
    ListPrinter.print_list(@people.list)
    until person_index > -1 && person_index < @people.list.length
      puts 'person index:'
      person_index = gets.chomp.to_i
    end
    puts 'date: (YYYY/MM/DD): '
    date = gets.chomp
    Rental.new(date, @people.filter_with_index(person_index), @books.filter_with_index(book_index))
    puts 'Rental created succesfully'
  end

  def list_rentals
    id = 0
    until id.positive?
      puts 'id of person: '
      id = gets.chomp.to_i
    end
    puts 'rentals: '
    ListPrinter.print_list(@people.list)
    @people.filter_with_id(id).rentals.each do |rental|
      puts "Date: #{rental.date}, book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end

def main
  app = App.new
  app.start
end

main
