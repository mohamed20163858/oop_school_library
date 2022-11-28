require './option'
require './menu'

def main
  number = 0
  menu = Menu.new
  option = Options.new
  while number != '7'
    menu.display_options
    number = gets.chomp
    option.select_option(number)
  end
end

main
