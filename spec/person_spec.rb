# rubocop:disable all
require_relative '../person'
describe Person do
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
      person = Person.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect(person).to be_instance_of(Person)
    end
    it 'test using only one  argument' do
      # act
      person = Person.new(@age)
      # assert
      expect(person).to be_instance_of(Person)
    end
    it 'test getting value of age from person' do
      # act
      person = Person.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect(person.age).to eq @age
    end
    it 'test getting value of name from author' do
      # act
      person = Person.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect(person.name).to eq @name
    end
    it 'test getting value of id from person' do
      # act
      person = Person.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect(person.id).to eq @id
    end
    it 'test getting value of parent_permission from person' do
      # act
      person = Person.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect(person.parent_permission).to eq @parent_permission
    end
    it 'test setting the value of age from person' do
      # act
      person = Person.new(@age, @name, @id, parent_permission: @parent_permission)
      person.age = 14
      # assert
      expect(person.age).to eq 14
    end
    it 'test setting the value of name from person' do
      # act
      person = Person.new(@age, @name, @id, parent_permission: @parent_permission)
      person.name = 'mostafa'
      # assert
      expect(person.name).to eq 'mostafa'
    end
    it 'test setting the value of id from person' do
      # act
      person = Person.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect { person.id = 150 }.to raise_error(NoMethodError)
    end
    it 'test setting the value of rentals from person' do
      # act
      person = Person.new(@age, @name, @id, parent_permission: @parent_permission)
      person.rentals.push('rental_object')
      # assert
      expect(person.rentals[0]).to eq 'rental_object'
    end
    it 'test the existence of method can_use_services?' do
      # act
      person = Person.new(@age, @name, @id, parent_permission: @parent_permission)
      # assert
      expect(person).to respond_to(:can_use_services?)
    end
    it 'test the logic of method can_use_services?' do
      # arrange
      age = 17
      parent_permission = false
      # act
      person = Person.new(age, @name, @id, parent_permission: parent_permission)
      # assert
      expect(person.can_use_services?).to be false
    end
    it 'test the logic of method can_use_services?' do
      # arrange
      age = 28
      parent_permission = false
      # act
      person = Person.new(age, @name, @id, parent_permission: parent_permission)
      # assert
      expect(person.can_use_services?).to be true
    end
    it 'test the logic of method can_use_services?' do
      # arrange
      age = 10
      parent_permission = true
      # act
      person = Person.new(age, @name, @id, parent_permission: parent_permission)
      # assert
      expect(person.can_use_services?).to be true
    end
  end
end
