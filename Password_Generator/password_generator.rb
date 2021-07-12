module PasswordGenerator
  def random_password(pass_length, alphabets, numbers, special_characters)
    character = (alphabets.chomp.chars + special_characters.chars + numbers.chars)
    Array.new(pass_length, '').collect { character[rand(character.size)] }.join
  end
end
