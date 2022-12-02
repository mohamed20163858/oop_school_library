require_relative '../trimmer_decorator.rb'
describe  TrimmerDecorator do 
  context "test the behavior of class" do
    before(:all) do 
      #arrange
      @nameable = double('nameable')
    end
    it "test the existence of the class " do 
      #act
       trimmer_decorator =  TrimmerDecorator.new(@nameable)
      #assert 
      expect(trimmer_decorator).to be_instance_of(TrimmerDecorator)
    end
    it "test the TrimmerDecorator class is a child  of the Decorator class " do 
        #act
         trimmer_decorator =  TrimmerDecorator.new(@nameable)
        #assert 
        expect(trimmer_decorator).to be_kind_of(Decorator)
    end
    it "test the existence of correct_name method" do 
      #act
       trimmer_decorator =  TrimmerDecorator.new(@nameable)
      #assert 
      expect(trimmer_decorator).to respond_to(:correct_name)
    end
    it "test the behaviour of correct name method" do 
        #act 
         trimmer_decorator =  TrimmerDecorator.new(@nameable)
         allow(@nameable).to receive(:correct_name) {'mohamed abdel mohsen saleh'}
        #assert 
        expect(trimmer_decorator.correct_name).to eq 'mohamed ab'
    end
  end
end