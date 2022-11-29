class Book
  attr_accessor :title, :author, :index
  attr_reader :rentals

  def initialize(title, author, index)
    @title = title
    @author = author
    @index = index
    @rentals = []
  end
end
