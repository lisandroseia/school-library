require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new({ 'age' => 20, 'id' => 10, 'name' => 'jhon',
                             'specialization' => 'Masters' })
  end

  context '#new' do
    it 'takes hash as a parameter' do
      expect(@teacher).to be_instance_of(Teacher)
    end

    it 'expects no argument to raise an error' do
      expect { Teacher.new }.to raise_error(ArgumentError)
    end
  end

  context 'Inherits from Person and has Nameable as ancestor' do
    it 'Teacher should be a child of Person' do
      expect(@teacher).to be_kind_of(Person)
    end

    it 'Teacher should be a ancestor of Nameable' do
      expect(@teacher).to be_kind_of(Nameable)
    end
  end

  context '#to_s' do
    it 'should return a string with the class name, name, id, parent permit and age' do
      str = @teacher.to_s
      expect(str).to eql('[Teacher] ID: 10 Name: jhon Age: 20 specialization: Masters')
    end
  end


  context '#to_object' do
    it 'should return an object with classname and data' do
      obj = @teacher.to_object
      expect(obj).to eql({ class_name: 'Teacher', opt: { specialization: 'Masters', id: 10, name: 'jhon', age: 20 } })
    end
  end

  context '#can_use_services' do
    it 'Returns true' do
      expect(@teacher.can_use_services?).to be true 
    end
  end
end