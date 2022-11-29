require './student'
require './teacher'
require './book'
require './rental'
require 'json'

class App
  def initialize
    puts("Welcome to  School Library App!\n\n")
    @people = File.exist?('people.json')? self.load_people() : []
    @books = File.exist?('books.json')? self.load_books() : []
    @rentals = File.exist?('rentals.json')? self.load_rentals() : []
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
    index = @books.length
    book = Book.new(title, author, index)
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
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
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

  def save_people
    people = []
    @people.each do 
      |person|
      details = {}
      details['type'] = person.class.name 
      details['name'] = person.name
      details['id'] = person.id
      details['age'] = person.age
      if person.class.name == 'Student'
        details['parent_permission'] = person.parent_permission
      else 
        details['specialization'] = person.specialization
      end
      people.push(details);
    end
    File.write('people.json',JSON.generate(people));
  end

  def load_people
    people = []
    data = JSON.parse(File.read('people.json'))
    data.each do 
      |person|
      age = person['age'] 
      name = person['name'] 
      id = person['id'] 
      if person['type'] == 'Student'
        parent_permission = person['parent_permission']
        people.push(Student.new(age, name, id, parent_permission: parent_permission))
      else 
        specialization = person['specialization']
        people.push(Teacher.new(age, specialization, name, id))
      end
    end
    return people
  end

  def save_books 
    books = []
    @books.each do 
      |book|
      details = {}
      details['title'] = book.title 
      details['author'] = book.author 
      details['index'] = book.index
      books.push(details)
    end
    File.write('books.json',JSON.generate(books));
  end

  def load_books 
    books = []
    data = JSON.parse(File.read('books.json'))
    data.each do 
      |book|
      title = book['title']
      author = book['author']
      index =  book['index']
      books.push(Book.new(title, author, index))
    end
    return books
  end

  def save_rentals 
    rentals = []
    @rentals.each do 
      |rental|
      details = {}
      details['date'] = rental.date 
      title = rental.book.title 
      author = rental.book.author
      index = rental.book.index
      details['book'] = {'title' => title, 'author' => author, 'index' => index}
      type = rental.person.class.name 
      name = rental.person.name 
      id = rental.person.id 
      age = rental.person.age 
      details['person'] = {'type' => type, 'name' => name, 'id' => id, 'age' => age}
      if type == 'Student'
        details['person']['parent_permission'] = rental.person.parent_permission
      else
        details['person']['specialization'] = rental.person.specialization
      end
      rentals.push(details)
    end
    File.write('rentals.json',JSON.generate(rentals));
  end

  def load_rentals 
    rentals = []
    data = JSON.parse(File.read('rentals.json'))
    data.each do 
      |rental|
      date = rental['date']
      person = @people[rental['person']['id'] - 1]
      book = @books[rental['book']['index']]
      rentals.push(Rental.new(date, book, person))
    end
    return rentals
  end
end
