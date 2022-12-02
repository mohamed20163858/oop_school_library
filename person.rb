require './nameable'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals, :parent_permission

  def initialize(age, name = 'Unknown', id = nil, parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end

  private :of_age?
  public :can_use_services?
end
