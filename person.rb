require './nameable'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  @@count = 0
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @@count += 1
    @id = @@count
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    return true if is_of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end

  private :of_age?
  public :can_use_services?
end
