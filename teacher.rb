require_relative 'person'

class Teacher < Person
  attr_reader :specialization, :id

  def initialize(opt)
    super(opt['age'], opt['id'], opt['name'])
    @specialization = opt['specialization'] || nil
  end

  def to_s
    "[Teacher] #{super} specialization: #{specialization}"
  end

  def to_object
    { class_name: 'Teacher', opt: { specialization: @specialization, id: @id, name: @name, age: @age } }
  end

  def can_use_services?
    true
  end
end
