require './decorator'
class TrimmerDecorator < Decorator
  def correct_name
    str = @nameable.correct_name
    str.length > 10 ? str[0, 10] : str
  end
end
