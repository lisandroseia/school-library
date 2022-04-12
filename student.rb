require_relative 'person'

class Student < Person
  attr_reader :id, :parent_permission

  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_s
    "[Student] #{super} parent permit: #{@parent_permission}"
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
