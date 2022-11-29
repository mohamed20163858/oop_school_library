class Load
  def load_people
    people = []
    data = JSON.parse(File.read('people.json'))
    data.each do |person|
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
    people
  end

  def load_books
    books = []
    data = JSON.parse(File.read('books.json'))
    data.each do |book|
      title = book['title']
      author = book['author']
      index = book['index']
      books.push(Book.new(title, author, index))
    end
    books
  end

  def load_rentals(app)
    rentals = []
    data = JSON.parse(File.read('rentals.json'))
    data.each do |rental|
      date = rental['date']
      person = app.people[rental['person']['id'] - 1]
      book = app.books[rental['book']['index']]
      rentals.push(Rental.new(date, book, person))
    end
    rentals
  end
end
