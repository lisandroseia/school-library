require_relative '../rental'

describe Rental do
  before :each do
    person = double('Person')
    book = double('Book')
    allow(person).to receive(:id) { 10 }
    allow(person).to receive(:rentals) { [] }
    allow(book).to receive(:title) { 'Harry Potter' }
    allow(book).to receive(:rentals) { [] }

    @rental = Rental.new({ 'date' => '1995/03/22', 'person' => person, 'book' => book })
  end

  context '#new' do
    it 'should return an instance of Rental' do
      expect(@rental).to be_instance_of(Rental)
    end
  end

  context '#to_object' do
    it 'should return an object' do
      case_test = @rental.to_object
      expected = { class_name: 'Rental', date: '1995/03/22', person: 10, book: 'Harry Potter' }
      expect(case_test).to eql(expected)
    end
  end
end
