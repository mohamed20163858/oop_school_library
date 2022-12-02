# rubocop:disable all
require_relative '../student'
describe Student do
  context 'test the behavior of class' do
    before(:each) do
      # arrange
      @id = 170
      @name = 'Mohamed Saleh'
      @age = 28
      @parent_permission = true
    end
    it 'test the existence of the class ' do
      # act
      student = Student.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect(student).to be_instance_of(Student)
    end
    it 'test the Student is a child of the Person class ' do
      # act
      student = Student.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect(student).to be_kind_of(Person)
    end
    it 'test using only one  argument' do
      # act
      student = Student.new(@age)
      # assert
      expect(student).to be_instance_of(Student)
    end
    it 'test getting value of age from student' do
      # act
      student = Student.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect(student.age).to eq @age
    end
    it 'test getting value of name from author' do
      # act
      student = Student.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect(student.name).to eq @name
    end
    it 'test getting value of id from student' do
      # act
      student = Student.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect(student.id).to eq @id
    end
    it 'test getting value of parent_permission from student' do
      # act
      student = Student.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect(student.parent_permission).to eq @parent_permission
    end
    it 'test setting the value of age from student' do
      # act
      student = Student.new(@age, @name, @id, parent_permission: @parent_permission)
      student.age = 14
      # assert
      expect(student.age).to eq 14
    end
    it 'test setting the value of name from student' do
      # act
      student = Student.new(@age, @name, @id, parent_permission: @parent_permission)
      student.name = 'mostafa'
      # assert
      expect(student.name).to eq 'mostafa'
    end
    it 'test setting the value of id from student' do
      # act
      student = Student.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect { student.id = 150 }.to raise_error(NoMethodError)
    end
    it 'test setting the value of rentals from student' do
      # act
      student = Student.new(@age, @name, @id, parent_permission: @parent_permission)
      student.rentals.push('rental_object')
      # assert
      expect(student.rentals[0]).to eq 'rental_object'
    end
    it 'test the existence of method can_use_services?' do
      # act
      student = Student.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect(student).to respond_to(:can_use_services?)
    end
    it 'test the logic of method can_use_services?' do
      # arrange
      age = 17
      parent_permission = false
      # act
      student = Student.new(age, @name, @id, parent_permission: parent_permission)
      # assert
      expect(student.can_use_services?).to be false
    end
    it 'test the logic of method can_use_services?' do
      # arrange
      age = 28
      parent_permission = false
      # act
      student = Student.new(age, @name, @id, parent_permission: parent_permission)
      # assert
      expect(student.can_use_services?).to be true
    end
    it 'test the logic of method can_use_services?' do
      # arrange
      age = 10
      parent_permission = true
      # act
      student = Student.new(age, @name, @id, parent_permission: parent_permission)
      # assert
      expect(student.can_use_services?).to be true
    end
    it 'test play_hooky method' do
      # act
      student = Student.new(@age)
      # assert
      expect(student.play_hooky).to eq '¯\(ツ)/¯'
    end
    it 'test add_classroom method' do
      # arrange
      classroom = double('classroom')
      allow(classroom).to receive(:students) { [] }
      # act
      student = Student.new(@age)
      student.add_classroom(classroom)
      # assert
      expect(student.classroom).to eq classroom
    end
  end
end
