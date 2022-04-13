require_relative 'book'
require_relative 'rental'
require_relative 'people'
require_relative 'printer'
require_relative 'bookcreator'
require_relative 'rentalcreator'
require_relative 'io'

class App
  def initialize
    @manager = FileManager.new
    @books = BookList.new
    @people = People.new
    @rentals = RentalCreator.new
    @manager.read(@books, 'books.json')
    @manager.read(@people, 'people.json')
    @manager.rentals_read(@rentals, @people, @books, 'rentals.json')
  end

  def start(num)
    case num.to_i
    when 1 then ListPrinter.print_list(@books.list)
    when 2 then ListPrinter.print_list(@people.list)
    when 3 then add_person
    when 4 then @books.add_book
    when 5 then @rentals.add_rental(@people, @books)
    when 6 then list_rentals
    when 7 then handle_exit
    end
  end

  private

  def add_person
    puts 'Do you want to create a student(1) or a teacher(2)?[input the number]'
    input = gets.chomp.to_i
    while input > 2 || input < 1
      puts 'Please input correct choice'
      input = gets.chomp.to_i
    end
    @people.add_person(input == 1 ? CreateStudent.new : CreateTeacher.new)
  end

  def list_rentals
    id = 0
    until id.positive?
      puts 'id of person: '
      ListPrinter.print_list(@people.list)
      id = gets.chomp.to_i
    end
    puts 'rentals: '
    ListPrinter.print_list(@people.list)
    @people.filter_with_id(id).rentals.each do |rental|
      puts "Date: #{rental.date}, book: #{rental.book.title} by #{rental.book.author}"
    end
  end

  def handle_exit
    @manager.write(@books.list, 'books.json')
    @manager.write(@people.list, 'people.json')
    @manager.write(@rentals.list, 'rentals.json')

    'exit'
  end
end
