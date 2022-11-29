require './app'

class Options
  def initialize
    @app = App.new
  end

  def select_option(number)
    case number
    when '1'
      @app.list_books
    when '2'
      @app.list_persons
    when '3'
      @app.create_a_person
    when '4'
      @app.create_a_book
    when '5'
      @app.create_a_rental
    when '6'
      @app.list_rentals
    when '7'
      @app.save_people
      @app.save_books
      @app.save_rentals
    end
  end
end
