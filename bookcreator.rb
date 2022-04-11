class BookList
  attr_reader :list

  def initialize
    @list = []
  end

  def add_book
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
    @list << Book.new(title, author)
    puts 'Book created succesfuly'
  end

  def filter_with_index(index)
    @list[index]
  end
end
