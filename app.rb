require './student'
require './teacher'
require './book'
require './rental'
class App
  def initialize
    puts("Welcome to  School Library App!\n\n")
    @people = []
    @books = []
  end

  def create_a_person
    print('Do you want to create a student (1) or a teacher (2) or' \
          'return to main menu (any other key)? [Input the number]: ')
    num = gets.chomp
    case num
    when '1'
      create_a_student
    when '2'
      create_a_teacher
    else
      puts('return to main menu')
    end
  end

  def create_a_student
    print('Age: ')
    age = gets.chomp
    print('Name: ')
    name = gets.chomp
    print('Has parent permission ? [Y/N] : ')
    permission = gets.chomp.downcase
    while permission != 'n' && permission != 'y'
      puts('invalid input')
      print('Has parent permission ? [Y/N] : ')
      permission = gets.chomp.downcase
    end
    parent_permission = permission == 'y'
    id = @people.length + 1
    student = Student.new(age, name, id, parent_permission: parent_permission)
    @people.push(student)
    puts('Person created successfully')
  end

  def create_a_teacher
    print('Age: ')
    age = gets.chomp
    print('Name: ')
    name = gets.chomp
    print('Specialization: ')
    specialization = gets.chomp
    id = @people.length + 1
    teacher = Teacher.new(age, specialization, name, id)
    @people.push(teacher)
    puts('Person created successfully')
  end

  def create_a_book
    print('Title: ')
    title = gets.chomp
    print('Author: ')
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts('Book created successfully')
  end

  def list_books(mode: false)
    @books.each_with_index do |book, i|
      puts("#{mode ? "#{i}) " : ''}Title: \"#{book.title}\", Author: #{book.author}")
    end
  end

  def list_persons(mode: false)
    @people.each_with_index do |person, i|
      puts("#{mode ? "#{i}) " : ''}[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}")
    end
  end

  def create_a_rental
    puts('Select a book from the following list by number')
    list_books(mode: true)
    book_index = gets.chomp.to_i
    puts('Select a person from the following list by number')
    list_persons(mode: true)
    person_index = gets.chomp.to_i
    print('Date: ')
    date = gets.chomp
    book = @books[book_index]
    person = @people[person_index]
    Rental.new(date, book, person)
    puts('Rental created successfully')
  end

  def list_rentals
    print('ID of person: ')
    id = gets.chomp.to_i - 1
    person = @people[id]
    puts('Rentals:')
    person.rentals.each do |rental|
      puts("Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}")
    end
  end
end
