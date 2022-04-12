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

  def start(num)
    case num.to_i
    when 1 then ListPrinter.print_list(@books.list)
    when 2 then ListPrinter.print_list(@people.list)
    when 3 then add_person
    when 4 then @books.add_book
    when 5 then create_rental
    when 6 then list_rentals
    when 7 then 'exit'
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
