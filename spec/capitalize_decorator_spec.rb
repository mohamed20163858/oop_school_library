require_relative '../capitalize_decorator.rb'
describe  CapitalizeDecorator do 
  context "test the behavior of class" do
    before(:all) do 
      #arrange
      @nameable = double('nameable')
    end
    it "test the existence of the class " do 
      #act
       capitalize_decorator =  CapitalizeDecorator.new(@nameable)
      #assert 
      expect(capitalize_decorator).to be_instance_of(CapitalizeDecorator)
    end
    it "test the CapitalizeDecorator class is a child  of the Decorator class " do 
        #act
         capitalize_decorator =  CapitalizeDecorator.new(@nameable)
        #assert 
        expect(capitalize_decorator).to be_kind_of(Decorator)
    end
    it "test the existence of correct_name method" do 
      #act
       capitalize_decorator =  CapitalizeDecorator.new(@nameable)
      #assert 
      expect(capitalize_decorator).to respond_to(:correct_name)
    end
    it "test the behaviour of correct name method" do 
        #act 
         capitalize_decorator =  CapitalizeDecorator.new(@nameable)
         allow(@nameable).to receive(:correct_name) {'mohamed'}
        #assert 
        expect(capitalize_decorator.correct_name).to eq 'Mohamed'
    end
  end
end