require './decorator'
class CapitalizeDecorator < Decorator
  def correct_name
    return @nameable.correct_name.capitalize()
  end
end
