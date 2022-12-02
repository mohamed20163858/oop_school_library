require_relative '../nameable.rb'
describe  Nameable do 
  context "test the behavior of class" do
    it "test the existence of the class " do 
      #act
       nameable =  Nameable.new
      #assert 
      expect(nameable).to be_instance_of(Nameable)
    end
    it "test the existence of correct_name method" do 
      #act
       nameable =  Nameable.new
      #assert 
      expect(nameable).to respond_to(:correct_name)
    end
    it "test the behaviour of correct name method" do 
        #act 
         nameable =  Nameable.new
        #assert 
        expect{ nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end