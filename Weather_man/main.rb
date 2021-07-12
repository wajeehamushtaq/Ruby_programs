# frozen_string_literal: true

require_relative 'weather_man'
include Weatherman

arg1 = ARGV[0]
arg2 = ARGV[1]
arg3 = ARGV[2]

case arg1
when '-e'
  Weatherman.option1(arg2, arg3)

when '-a'
  Weatherman.option2(arg2, arg3)

when '-c'
  Weatherman.option3(arg2, arg3)

else
  puts 'Given argument function not available'
end
