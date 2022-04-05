require_relative 'nameable'

class BaseDecorator < Nameable

  attr_accessor :namable

  def initialize(namable = Nameable)
    super()
    @namable = namable
  end

  def correct_name
    @namable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @namable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    name = @namable.correct_name
    name.length > 10 ? name[0, 9] : name
  end
end

