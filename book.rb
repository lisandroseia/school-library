class Book
  attr_accessor :author, :title

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals(rent)
    @rentals.push(rent)
  end
end
