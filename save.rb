class Save
  def save_people(data)
    people = []
    data.each do |person|
      details = {}
      details['type'] = person.class.name
      details['name'] = person.name
      details['id'] = person.id
      details['age'] = person.age
      if person.instance_of?(::Student)
        details['parent_permission'] = person.parent_permission
      else
        details['specialization'] = person.specialization
      end
      people.push(details)
    end
    File.write('people.json', JSON.generate(people))
  end

  def save_books(data)
    books = []
    data.each do |book|
      details = {}
      details['title'] = book.title
      details['author'] = book.author
      details['index'] = book.index
      books.push(details)
    end
    File.write('books.json', JSON.generate(books))
  end

  def create_person_hash(person)
    type = person.class.name
    name = person.name
    id = person.id
    age = person.age
    if type == 'Student'
      { 'type' => type, 'name' => name, 'id' => id, 'age' => age,
        'parent_permission' => person.parent_permission }
    else
      { 'type' => type, 'name' => name, 'id' => id, 'age' => age, 'specialization' => person.specialization }
    end
  end

  def create_book_hash(book)
    title = book.title
    author = book.author
    index = book.index
    { 'title' => title, 'author' => author, 'index' => index }
  end

  def save_rentals(data)
    rentals = []
    data.each do |rental|
      details = {}
      details['date'] = rental.date
      details['book'] = create_book_hash(rental.book)
      details['person'] = create_person_hash(rental.person)
      rentals.push(details)
    end
    File.write('rentals.json', JSON.generate(rentals))
  end
end
