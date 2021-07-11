require_relative "weather_man.rb"
include WeatherMan

arg1 = ARGV[0]
arg2 = ARGV[1]
arg3 = ARGV[2]

if arg1 == '-e'
  WeatherMan.option_1(arg2, arg3)
elsif arg1 == '-a'
  WeatherMan.option_2(arg2, arg3)
elsif arg1 == '-c'
  WeatherMan.option_3(arg2, arg3)
else
  puts 'Given argument function not available'
end
