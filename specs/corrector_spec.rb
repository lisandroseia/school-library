require_relative '../base_decorator.rb'

describe BaseDecorator do
  context "#new" do
    it 'should be an instance of base_decorator' do
      base_decorator = BaseDecorator.new()

      expect base_decorator.to be_instance_of BaseDecorator
    end
  end
end

describe TrimmerDecorator do
  context "#correct_name" do
    it 'should fix the word to 10 characters' do
      case_test = "Lisandrooooo"

      cd = TrimmerDecorator.new()
      expected = "Lisandrooo"

      expect cd.correct_name case_test.to be expected
    end
  end
end

describe CapitalizeDecorator do
  context "#correct_name" do
    it 'should capitalize the given word' do
      case_test = "zeeshan"

      cd = CapitalizeDecorator.new()
      expected = "zeeshan"

      expect cd.correct_name case_test.to be expected
    end
  end
end
