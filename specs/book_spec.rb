require_relative '../book'

describe Book do
  before :each do
    @book = Book.new({ 'title' => 'jhon', 'author' => 'doe' })
  end

  context '#new' do
    it 'takes 1 hash as parameter and returns a Book object' do
      expect(@book).to be_instance_of(Book)
    end

    it 'receives a non hash value as paremeter should raise' do
      expect(-> { Book.new('title', 'author') }).to raise_error(ArgumentError)
    end
  end

  context '#to_s' do
    it 'should return a string with the title and the author' do
      str = @book.to_s
      expect(str).to eql('Title: jhon Author: doe')
    end
  end

  context '#to_object' do
    it 'should return an object with classname and data' do
      obj = @book.to_object
      expect(obj).to eql({ class_name: 'Book', opt: { title: 'jhon', author: 'doe' } })
    end
  end

  context '#add_rentals' do
    it 'should create a rental' do
      person = double('Person')

      allow(person).to receive(:rentals) { [] }

      @book.add_rentals('2020/20/20', person)
      expect(@book.rentals.length).to be(1)
    end
  end
end
