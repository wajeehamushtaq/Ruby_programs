require_relative 'password_generator'
include PasswordGenerator

puts '-----------------------------'
puts ' Password Generator Program  '
puts '-----------------------------'

print 'Enter length of password: '
pass_length = Integer(gets)
alphabets = ''
numbers = 0
special_characters = ''
flag = true

while flag
  puts "Select Options: "
  puts "1: Enter Alphabets "
  puts "2: Enter Numbers  "
  puts "3: Enter special characters "
  puts "4: Display passwords \n"
  option = Integer(gets)

  case option

  when 1
    print 'Enter alphabets: '
    alphabets = gets

  when 2
    print 'Enter number: '
    numbers = Integer(gets)
    print "\n"

  when 3
    print 'Enter special character: '
    special_characters = gets.chomp
    print "\n"

  when 4
    puts "Generated Password: "
    puts PasswordGenerator.random_password(pass_length, alphabets, numbers.to_s, special_characters)
    flag = false
    print "\n"

  else
    puts '\n This option is not available'

  end

end
