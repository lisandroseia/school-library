class Rental
  attr_accessor :date, :person, :book

  def initialize(opt)
    @date = opt['date']
    @person = opt['person']
    @book = opt['book']
    @person.rentals.push(self)
    @book.rentals.push(self)
  end

  def to_object
    { class_name: 'Rental', date: @date, person: @person.id, book: @book.title }
  end
end
