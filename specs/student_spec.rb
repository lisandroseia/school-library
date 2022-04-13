require_relative '../student'

describe Student do
  before :each do
    @student = Student.new({ 'age' => 20, 'id' => 10, 'name' => 'jhon', 'parent_permission' => true,
                             'classroom' => nil })
  end

  context '#new' do
    it 'takes hash as a parameter' do
      expect(@student).to be_instance_of(Student)
    end

    it 'expects no argument to raise an error' do
      expect { Student.new }.to raise_error(ArgumentError)
    end
  end

  context 'Inherits from Person and has Nameable as ancestor' do
    it 'Student should be a child of Person' do
      expect(@student).to be_kind_of(Person)
    end

    it 'Student should be a ancestor of Nameable' do
      expect(@student).to be_kind_of(Nameable)
    end
  end

  context '#to_s' do
    it 'should return a string with the class name, name, id, parent permit and age' do
      str = @student.to_s
      expect(str).to eql('[Student] ID: 10 Name: jhon Age: 20 parent permit: true')
    end
  end

  context '#classroom' do
    it 'should update the classroom' do
      classroom = double('Classroom')
      allow(classroom).to receive(:students) { [] }
      @student.classroom = classroom
      expect(@student.classroom).to be(classroom)
    end
  end

  context '#to_object' do
    it 'should return an object with classname and data' do
      obj = @student.to_object
      expect(obj).to eql({ class_name: 'Student', opt: { classroom: nil, id: 10, name: 'jhon', age: 20,
        parent_permission: true } })
    end
  end

  context '#play_hooky' do
    it '¯\(ツ)/¯' do
      expect(@student.play_hooky).to eql ("¯\(ツ)/¯") 
    end
  end
end
