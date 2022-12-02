require_relative '../rental.rb'
describe  Rental do 
  context "test the behavior of class" do
    before(:each) do 
      #arrange
      @date = '2020-11-09'
      @book = double('book')
      @person = double('person')
      allow(@book).to receive(:rentals) { [] }
      allow(@person).to receive(:rentals) { [] }

    end
    it "test the existence of the class " do 
      #act
       rental =  Rental.new(@date, @book, @person )
      #assert 
      expect(rental).to be_instance_of(Rental)
    end
    it "test using no argument" do 
      #assert 
      expect {  Rental.new }.to raise_error(ArgumentError)
    end
    it "test getting value of date from  rental" do 
      #act
       rental =  Rental.new(@date, @book, @person )
      #assert 
      expect( rental.date).to eq @date
    end
    it "test setting the value of date from  rental" do 
        #act 
         rental =  Rental.new(@date, @book, @person )
         rental.date = 'test_date'
        #assert 
        expect( rental.date).to eq 'test_date'
    end
  end
end