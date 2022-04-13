require_relative 'person'

class Student < Person
  attr_reader :id, :parent_permission

  def initialize(opt)
    super(opt['age'], opt['id'], opt['name'], parent_permission: opt['parent_permission'])
    @classroom = opt['classroom'] || nil
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_s
    "[Student] #{super} parent permit: #{@parent_permission}"
  end

  def to_object
    { class_name: 'Student', opt: { classroom: @classroom, id: @id, name: @name, age: @age,
                                    parent_permission: @parent_permission } }
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
