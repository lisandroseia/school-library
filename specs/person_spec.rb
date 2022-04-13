require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(20, 10, 'jhon', parent_permission: true)
  end

  context '#new' do
    it 'takes 4  parameter and returns a Person object' do
      expect(@person).to be_instance_of(Person)
    end

    it 'expects no age argument to raise an error' do
      expect(-> { Person.new }).to raise_error(ArgumentError)
    end
  end

  context '#can_use_services' do
    it 'should return true when age > 18' do
      bool = @person.can_use_services?
      expect(bool).to be true
    end

    it 'should return false when age < 18 && !parents_permission' do
      @person.age = 15
      @person.parent_permission = false
      bool = @person.can_use_services?
      expect(bool).to be false
    end

    it 'should return false when age < 18 && !parents_permission' do
      @person.age = 15
      @person.parent_permission = true
      bool = @person.can_use_services?
      expect(bool).to be true
    end
  end

  context '#to_s' do
    it 'should return a string with the id, name and age' do
      str = @person.to_s
      expect(str).to eql('ID: 10 Name: jhon Age: 20')
    end
  end

  context '#add_rentals' do
    it 'should create a rental' do
      book = double('Book')

      allow(book).to receive(:rentals) { [] }

      @person.add_rentals('2020/20/20', book)
      expect(@person.rentals.length).to be(1)
    end
  end
end
