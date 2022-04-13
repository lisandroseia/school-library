require_relative '../base_decorator'
require_relative '../person'

describe BaseDecorator do
  before :each do
    @person = Person.new(20, 10, 'jhon', parent_permission: true)
  end

  context '#new' do
    it 'should be an instance of base_decorator' do
      base_decorator = BaseDecorator.new(@person)

      expect(base_decorator).to be_instance_of BaseDecorator
    end
  end
end

describe TrimmerDecorator do
  before :each do
    @person = Person.new(20, 10, 'jhonjhonjhon', parent_permission: true)
  end
  context '#correct_name' do
    it 'should fix the word to 10 characters' do
      cd = TrimmerDecorator.new(@person)

      expect(cd.correct_name).to eql('jhonjhonj')
    end
  end
end

describe CapitalizeDecorator do
  before :each do
    @person = Person.new(20, 10, 'jhon', parent_permission: true)
  end
  context '#correct_name' do
    it 'should capitalize the given word' do
      cd = CapitalizeDecorator.new(@person)

      expect(cd.correct_name).to eql('Jhon')
    end
  end
end
