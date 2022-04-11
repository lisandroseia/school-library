require_relative 'rental'

class Book
  attr_accessor :author, :title, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def to_s
    "Title: #{@title} Author: #{@author}"
  end

  def add_rentals(date, person)
    Rental.new(date, person, self)
  end
end
