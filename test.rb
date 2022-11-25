# require './person'
# require './capitalize_decorator'
# require './trimmer_decorator'
# person = Person.new(22, 'maximilianus')
# person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# capitalized_trimmed_person.correct_name
require './classroom'
require './student'
require './person'
require './book'
require './rental'
moh = Student.new(29, 'Mohamed')
class1 = Classroom.new('1/1')
moh.add_classroom(class1)
puts class1.students[0].name
mos = Student.new(27, 'Mostafa')
class1.add_student(mos)
puts mos.classroom.label
mohsen = Person.new(24, 'Mohsen')
ali = Person.new(30, 'Ali')
book1 = Book.new('journey', 'momo mohsen')
book2 = Book.new('Earth', 'marwa shaheen')
Rental.new('2020-5-4', book1, mohsen)
Rental.new('2021-10-8', book1, ali)
Rental.new('2022-4-17', book2, ali)
puts 'Test persons relationship'
puts 'mohsen:-'
puts mohsen.rentals.count
puts(mohsen.rentals.map { |rental| [rental.date, rental.book.title] })
puts 'Ali:-'
puts ali.rentals.count
puts(ali.rentals.map { |rental| [rental.date, rental.book.title] })
puts 'Test books relationship'
puts 'book1:-'
puts book1.rentals.count
puts(book1.rentals.map { |rental| [rental.date, rental.person.name] })
puts 'book2:-'
puts book2.rentals.count
puts(book2.rentals.map { |rental| [rental.date, rental.person.name] })
