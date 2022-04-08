require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @num = 0
  end

  def start
    puts 'Welcome to School Library!'
    menu while @num != 7
  end

  private

  def menu
    until @num < 7 && @num.positive?
      puts "Please choose an option by entering a number\n1- List all books\n2- List all people\n3- Create a person
4- Create a book\n5- Create a rental\n6- List all rentals\n7- exit"
      @num = gets.chomp.to_i
    end
    case @num.to_i
    when 1 then list_books_flow
    when 2 then list_people_flow
    when 3 then add_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals
    when 7 then puts 'exiting'
    end
  end

  def add_person
    input = ''
    until input.to_i.positive? && input.to_i < 3
      puts 'Do you want to create a student(1) or a teacher(2)?[input the number]'
      input = gets.chomp
      input == '1' ? create_student : create_teacher
    end
    @num = 0
  end

  def create_student
    age = 0
    permision = true
    input = ''
    until age.positive?
      puts 'age:'
      age = gets.chomp.to_i
    end
    puts 'name:'
    name = gets.chomp
    if age < 18
      until %w[Y N].include?(input)
        puts 'has parents permission?[Y,N]'
        input = gets.chomp.upcase
        permision = input == 'Y'
      end
    end
    student = Student.new(nil, age, name, parent_permission: permision)
    @people.push(student)
    puts 'Student created succesfuly!'
    reset
  end

  def create_teacher
    age = 0
    until age.positive?
      puts 'age: '
      age = gets.chomp.to_i
    end
    puts 'name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    puts teacher.name, teacher.age, teacher.specialization
    puts 'Teacher created succesfully'
    reset
  end

  def create_book
    title = ''
    author = ''
    until title.length.positive?
      puts 'Title:'
      title = gets.chomp
    end
    until author.length.positive?
      puts 'Author'
      author = gets.chomp
    end
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created succesfuly'
    reset
  end

  def list_people
    @people.each_with_index do |people, index|
      puts "#{index}) [#{people.class.name}] Name: #{people.name} ID: #{people.id} Age: #{people.age}"
    end
  end

  def list_people_flow
    list_people
    reset
  end

  def list_books_flow
    list_books
    reset
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title} Author: #{book.author}"
    end
  end

  def create_rental
    book_index = -1
    person_index = -1
    puts 'select a book from the following list by number'
    list_books
    until book_index > -1 && book_index < @books.length
      puts 'book index:'
      book_index = gets.chomp.to_i
    end
    puts 'select a person from the following list by number'
    list_people
    until person_index > -1 && person_index < @people.length
      puts 'person index:'
      person_index = gets.chomp.to_i
    end
    puts 'date: (YYYY/MM/DD): '
    date = gets.chomp
    rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals.push(rental)
    puts 'Rental created succesfully'
    reset
  end

  def reset
    puts 'press enter to continue to main menu'
    gets.chomp
    @num = 0
  end

  def list_rentals
    id = 0
    until id.positive?
      puts 'id of person: '
      id = gets.chomp.to_i
    end
    puts 'rentals: '
    @people.each do |person|
      next unless person.id == id

      person.rentals.each do |rental|
        puts "Date: #{rental.date}, book: #{rental.book.title} by #{rental.book.author}"
      end
    end
    reset
  end
end

def main
  app = App.new
  app.start
end

main
