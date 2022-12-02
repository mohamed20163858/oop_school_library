require_relative '../book.rb'
describe Book do 
  context "test the behavior of class" do
    before(:each) do 
      #arrange
      @title = 'journey of the center of the earth'
      @author = 'mohamed saleh'
      @index = 1
    end
    it "test the existence of the class " do 
      #act
      book = Book.new(@title, @author, @index)
      #assert 
      expect(book).to be_instance_of(Book)
    end
    it "test using only one  argument" do 
      #assert 
      expect { Book.new(@title) }.to raise_error(ArgumentError)
    end
    it "test using two  arguments" do 
      #assert 
      expect { Book.new(@title, @author) }.to raise_error(ArgumentError)
    end
    it "test getting value of title from book" do 
      #act
      book = Book.new(@title, @author, @index)
      #assert 
      expect(book.title).to eq @title
    end
    it "test getting value of title from author" do 
        #act
        book = Book.new(@title, @author, @index)
        #assert 
        expect(book.author).to eq @author
    end
    it "test getting value of index from book" do 
        #act
        book = Book.new(@title, @author, @index)
        #assert 
        expect(book.index).to eq @index
    end
    it "test setting the value of title from book" do 
        #act 
        book = Book.new(@title, @author, @index)
        book.title = 'test_title'
        #assert 
        expect(book.title).to eq 'test_title'
    end
    it "test setting the value of author from book" do 
        #act
        book = Book.new(@title, @author, @index)
        book.author = 'test_author'
        #assert 
        expect(book.author).to eq 'test_author'
    end
    it "test setting the value of index from book" do 
        #act 
        book = Book.new(@title, @author, @index)
        book.index = 107
        #assert 
        expect(book.index).to eq 107
    end
    it "test setting the value of rentals from book" do 
        #act
        book = Book.new(@title, @author, @index)
        book.rentals.push('rental_object')
        #assert 
        expect(book.rentals[0]).to eq 'rental_object'
    end
  end
end