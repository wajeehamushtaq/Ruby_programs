# frozen_string_literal: true

module Weatherman
  def read_file(file)
    File.readlines(file).select do |element|
      element.split('').include? ','
    end.map { |element| element.chomp.split ',' }
  end

  # Fuction to display the highest temperature of given file
  def high_temperature(path)
    file = File.open(path)
    if File.exist?(file)
      arr = read_file(file)
      count = File.foreach(file).inject(0) { |c, _line| c + 1 }
      max = max_2d_array(arr, count)[0]
      date = max_2d_array(arr, count)[1]
      [max, date]
    else
      puts 'File does not found'
    end
  end

  # Function display highest numbr for 2d array
  def max_2d_array(arr, count)
    i = 0
    max = 0
    while i != count
      if arr[i][1].to_i > max.to_i
        max = arr[i][1]
        date = i
      else
        i += 1
      end
    end
    [max, date]
  end

  # Fuction to display the lowest temperature of given file
  def low_temperature(path)
    file = File.open(path)
    arr = read_file(file)
    count = File.foreach(file).inject(0) { |c, _line| c + 1 }
    mini = min_2d_array(arr, count)[0]
    date = min_2d_array(arr, count)[1]
    [mini, date]
  end

  # Function display lowest numbr for 2d array
  def min_2d_array(arr, count)
    i = 1
    mini = 100
    while i != count
      if arr[i][3].nil?
        arr[i][3] = 100
      elsif arr[i][3].to_i < mini.to_i
        mini = arr[i][3]
        date = i
      else
        i += 1
      end
    end
    [mini, date]
  end

  # Fuction to display the maximum humidity of given file
  def humidity(path)
    file = File.open(path)
    arr = read_file(file)
    count = File.foreach(file).inject(0) { |c, _line| c + 1 }
    max = max_2d_array(arr, count)[0]
    date = max_2d_array(arr, count)[1]
    [max, date]
  end

  # Function to calculate highest number from array
  def highest_number(arr)
    i = 0
    index = 0
    max = 0
    while i != arr.size
      if arr[i].to_i > max.to_i
        max = arr[i]
        index = i
      else
        i += 1
      end
    end
    [max, index]
  end

  # Function to calculate lowest number from array
  def lowest_number(arr)
    i = 0
    mini = 100
    index = 0
    while i != arr.size
      if arr[i].to_i.zero?
        arr[i] = 100
      elsif arr[i].to_i < mini.to_i
        mini = arr[i].to_i
        index = i
      else
        i += 1
      end
    end
    [mini, index]
  end

  # Function to return month in string name
  def get_month(str)
    months = {
      '1' => 'Jan',
      '2' => 'Feb',
      '3' => 'Mar',
      '4' => 'Apr',
      '5' => 'May',
      '6' => 'Jun',
      '7' => 'Jul',
      '8' => 'Aug',
      '9' => 'Sep',
      '10' => 'Oct',
      '11' => 'Nov',
      '12' => 'Dec'
    }
    months[str]
  end

  # Function to display the highest average temperature from given month file
  def highest_average(path)
    file = File.open(path)
    arr = read_file(file)
    count = File.foreach(file).inject(0) { |c, _line| c + 1 }
    i = 0
    sum = 0
    while i != count
      sum += arr[i][1].to_i
      i += 1
    end
    sum / count
  end

  # Function to display the lowest average temperature from given month file
  def lowest_average(path)
    file = File.open(path)
    arr = read_file(file)
    count = File.foreach(file).inject(0) { |c, _line| c + 1 }
    i = 0
    sum = 0
    while i != count
      sum += arr[i][3].to_i
      i += 1
    end
    sum / count
  end

  # Function to display the average humidity from given month file
  def humidity_average(path)
    file = File.open(path)
    arr = read_file(file)
    count = File.foreach(file).inject(0) { |c, _line| c + 1 }
    i = 0
    sum = 0
    while i != count
      sum += arr[i][7].to_i
      i += 1
    end
    sum / count
  end

  # Function of bar chart for highest and lowest temperature on each day
  def bar_chart
    file = File.open('/home/wajeeha/Downloads/Devsinc/Week 3/Murree_weather/Murree_weather_2004_Aug.txt')
    arr = read_file(file)
    count = File.foreach(file).inject(0) { |c, _line| c + 1 }
    i = 1
    j = 0
    while i != count
      j = 0
      while j != arr[i][1].to_i
        print '*'.red
        j += 1
      end
      print "\n"
      k = 0
      while k != arr[i][3].to_i
        print '*'.blue
        k += 1
      end
      print "\n"
      i += 1
    end
  end

  # Function to display inline bar chart for highest and lowest temperature on each day
  def inline_bar_chart(path)
    file = File.open(path)
    arr = read_file(file)
    count = File.foreach(file).inject(0) { |c, _line| c + 1 }
    i = 1
    j = 0
    while i != count
      k = 0
      print "#{i} "
      while k != arr[i][3].to_i
        print '*'.blue
        k += 1
      end
      j = 0
      while j != arr[i][1].to_i
        print '*'.red
        j += 1
      end
      puts "#{k}-#{j}"
      i += 1
    end
  end

  # Function to display Option no: 1 '-e'
  def option1(arg2, arg3)
    month = 1
    max_arr = []
    min_arr = []
    hum_arr = []
    year = arg2
    date = 0
    file_path = arg3.split('/')
    file_name = file_path.last
    while month < 13
      path_mon = get_month(month.to_s)
      path = "#{arg3}/#{file_name}_#{year}_#{path_mon}.txt"
      if File.exist?(path)
        max_arr[month, date] = high_temperature(path)
        min_arr[month, date] = low_temperature(path)
        hum_arr[month, date] = humidity(path)
      end
      month += 1
    end
    puts("Highest: #{highest_number(max_arr)[0]}C on #{get_month(highest_number(max_arr)[1].to_s)} #{highest_number(max_arr)[1]}")
    puts("Lowest: #{lowest_number(min_arr)[0]}C on #{get_month(lowest_number(min_arr)[1].to_s)} #{lowest_number(min_arr)[1]}")
    puts("Humidity: #{highest_number(hum_arr)[0]}C on #{get_month(highest_number(hum_arr)[1].to_s)} #{highest_number(hum_arr)[1]}")
  end

  # Function to display Option no: 2 '-a'
  def option2(arg2, arg3)
    date = arg2.split('/')
    year = date[0]
    month = date[1]
    file_path = arg3.split('/')
    file_name = file_path.last
    path_mon = get_month(month.to_s)
    path = "#{arg3}/#{file_name}_#{year}_#{path_mon}.txt"
    puts("Highest Average: #{highest_average(path)}C ")
    puts("Lowest Average: #{lowest_average(path)}C ")
    puts("Average Humidity: #{humidity_average(path)}% ")
  end

  # Function to display Option no: 3 '-c'
  def option3(arg2, arg3)
    date = arg2.split('/')
    year = date[0]
    month = date[1]
    file_path = arg3.split('/')
    file_name = file_path.last
    path_mon = get_month(month.to_s)
    path = "#{arg3}/#{file_name}_#{year}_#{path_mon}.txt"
    puts "#{path_mon} #{year}"
    inline_bar_chart(path)
  end
end

# String classs to change color of text
class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def blue
    colorize(34)
  end
end
