require './app'
def select_option(number, app)
  case number
  when '1'
    app.list_books
  when '2'
    app.list_persons
  when '3'
    app.create_a_person
  when '4'
    app.create_a_book
  when '5'
    app.create_a_rental
  when '6'
    app.list_rentals
  end
end

def main
  number = 0
  app = App.new
  while number != '7'
    puts('Please choose an option by entering a number')
    puts('1 - List all books')
    puts('2 - List all people')
    puts('3 - Create a person')
    puts('4 - Create a book')
    puts('5 - Create a rental')
    puts('6 - List all rentals for a given person id')
    puts('7 - Exit')
    number = gets.chomp
    select_option(number, app)
  end
end
main
