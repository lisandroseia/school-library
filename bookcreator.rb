class BookList
  attr_accessor :list

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
    @list << Book.new({"title"=>title, "author"=>author})
    puts 'Book created succesfuly'
  end

  def filter_with_index(index)
    @list[index]
  end

  def filter_with_title(title)
    @list.select { |book| book.title.eql?(title) }[0]
  end

end
