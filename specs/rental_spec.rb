require_relative '../rental.rb'

describe Rental do
  before :each do
    person = double
    book = double
    allow(person).to reseive(:id) {10}
    allow(person).to reseive(:rentals) {[]}
    allow(book).to reseive(:title) {"Harry Potter"}
    allow(book).to reseive(:rentals) {[]}

    @rental = Rental.new {"date"=>"1995/03/22", "person"=>person, "book"=>book}  
  end

  context "#new" do
    it 'should return an instance of Rental' do
      expect @rental.to be_instance_of Rental
    end
  end

  context "#to_object" do
    case_test = @rental.to_object
    expected = { class_name: 'Rental', date: "1995/03/22", person: 10, book: "Harry Potter" }

    expect case_test.to eql expected
  end
end
