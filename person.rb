class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = nil
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age?
    @age >= 18
  end

  def can_use_services?
    return true if is_of_age? || @parent_permission

    false
  end

  private :is_of_age?
  public :can_use_services?
end
