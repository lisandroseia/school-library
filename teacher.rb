require_relative 'person'

class Teacher < Person
  attr_reader :specialization, :id

  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def to_s
    "[Teacher] #{super} specialization: #{specialization}"
  end

  def can_use_services?
    true
  end
end
