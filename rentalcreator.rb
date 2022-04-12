require_relative 'printer'

class RentalCreator
  attr_reader :list

  def initialize
    @list = []
  end

  def add_rental (people, books)
    book_index = -1
    person_index = -1
    puts 'select a book from the following list by number'
    ListPrinter.print_list(books.list)
    until book_index > -1 && book_index < books.list.length
      puts 'book index:'
      book_index = gets.chomp.to_i
    end
    puts 'select a person from the following list by number'
    ListPrinter.print_list(people.list)
    until person_index > -1 && person_index < people.list.length
      puts 'person index:'
      person_index = gets.chomp.to_i
    end
    puts 'date: (YYYY/MM/DD): '
    date = gets.chomp
    @list << Rental.new(date, people.filter_with_index(person_index), books.filter_with_index(book_index))
    puts 'Rental created succesfully'
  end
end
