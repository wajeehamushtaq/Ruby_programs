# Program to generate random password using alphabets, numbers and special characters

# random_password Method taking argument:
# - Password length
# - Aplhabets
# - Numbers
# - Special characters
def random_password(pass_length, alphabets, numbers, special_characters)
  character = (alphabets.chomp.chars + special_characters.chars + numbers.chars)
  password = Array.new(pass_length, '').collect { character[rand(character.size)] }.join
end

puts '-----------------------------'
puts ' Password Generator Program  '
puts '-----------------------------'

print 'Enter length of password: '
pass_length = Integer(gets)

print 'Enter alphabets: '
alphabets = gets

if alphabets.length >= pass_length
  puts 'Length of aplhabets should not be greater or equal to password length'
else
  print 'Enter number: '
  numbers = Integer(gets)
  if alphabets.length >= pass_length
    puts 'Length of numbers should not be greater or equal to password length'
  else
    print 'Enter special character: '
    special_characters = gets.chomp
    if alphabets.length >= pass_length
      puts 'Length of special characters should not be greater or equal to password length'
    else
      print random_password(pass_length, alphabets, numbers.to_s, special_characters)
    end
  end
end
