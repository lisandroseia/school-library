require_relative '../classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('A')
  end

  context '#new' do
    it 'should instatiate an instance of classroom' do
      expect(@classroom).to be_instance_of(Classroom)
    end

    it 'should raise an ArgumentError When passed a wrong argument' do
      expect { Classroom.new('title', 'author') }.to raise_error(ArgumentError)
    end
  end

  context '#add_student' do
    it 'should add a student to list' do
      student = double('Student')
      allow(student).to receive(:classroom=) { nil }
      @classroom.add_student(student)
      expect(@classroom.students.length).to be 1
    end
  end
end
