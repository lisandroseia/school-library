require_relative '../classroom.rb'

describe Classroom do
  before :each do
    @classroom = Classroom.new("A")  
  end

  context "#new" do
    it "should instatiate an instance of classroom" do
      expect(@classroom).to be_instance_of(Classroom)
    end

    it 'should raise an ArgumentError When passed a wrong argument' do
      expect{ Classroom.new('title', 'author') }.to raise_error(ArgumentError)
    end
  end

  context "#add_student" do
    student = double 'Student'

    allow(student).to receive(:classroom) {nil}
    expected = @classroom.add_student student

    expect @classroom.students.length.to be 1
  end
end
