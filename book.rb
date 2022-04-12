require_relative 'rental'

class Book
  attr_accessor :author, :title, :rentals

  def initialize(opt)
    @title = opt['title']
    @author = opt['author']
    @rentals = []
  end

  def to_s
    "Title: #{@title} Author: #{@author}"
  end

  def to_object
    obj = {class_name: "Book" , opt: {title: @title, author: @author} }
  end

  def add_rentals(date, person)
    Rental.new(date, person, self)
  end
end
