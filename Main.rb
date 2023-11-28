# ********************
# Name: Jeri Lei Concepcion
# Language: Ruby
# Paradigm(s): Object Oriented Programming
# Group Number and Section:  Group 4 - S18
# ********************

# File: Main.rb
# Purpose: Main file for the program.
#          This is where the program starts.
#          This file is responsible for the
#          flow of the program.

# this imports the files needed for the program to run
require_relative 'employee'   # this imports the Employee class
require_relative 'display'    # this imports the Display class
require_relative 'terminal'   # this imports the Terminal class

# this creates a new instance of the Employee class
# and assigns it to the variable employee
employee = Employee.new

# dynamic method for printing lines
def print_line(label, value)
  # this is to make sure that the lines are aligned
  puts "| #{label}: #{value}#{' ' * (41 - label.length - value.to_s.length)}|"
end

# this method generates the payroll for the day
# and displays it to the user
def generate_payroll(employee)
  Terminal.clear
  puts "+--------------------------------------------+"
  puts "|                Daily Payroll               |"
  puts "|                  Generated                 |"
  puts "+--------------------------------------------+"

  print_line("Daily Rate", employee.daily_rate)
  print_line("Time In", employee.time_in)
  print_line("Time Out", employee.time_out)
  print_line("Day Type", employee.day_type)
  print_line("Night Shift Hours", employee.night_shift_hours)
  print_line("Regular Overtime", employee.regular_overtime)
  print_line("Night Overtime Hours", employee.night_overtime)
  print_line("Day Salary", employee.day_salary)

  # Add the day salary to the weekly salaries
  employee.weekly_salaries << employee.day_salary
  print_line("Weekly Salary", employee.get_weekly_salary)

  puts "+--------------------------------------------+"
  Terminal.buffer("|+-Hit enter to continue..")
end

# this method generates the payroll for the week
# and displays it to the user
def generate_weekly_payroll(employee)
  Terminal.clear
  puts "+--------------------------------------------+"
  puts "|                   Weekly                   |"
  puts "|               Payroll Results              |"
  puts "|                  Generated                 |"
  puts "+--------------------------------------------+"

  # Display salary for each day
  employee.weekly_salaries.each_with_index do |salary, index|
    print_line("Day #{index + 1}", salary)
  end

  # Display total weekly salary
  print_line("Weekly Salary", employee.get_weekly_salary)

  puts "+--------------------------------------------+"
  Terminal.buffer("|+- Hit enter to continue..")
end

# this method modifies the default configurations
def modify_configurations(employee, day)
  is_terminated = false

  until is_terminated
    Display.configurations
    puts "+----------------------------------------+"
    puts "|   Modifying configurations for #{day}  |"
    puts "+----------------------------------------+"
    print 'Choice: '
    action = gets.chomp.to_i

    if action > 5 || action < 1
      next
    end

    case action
    when 1
      # modify daily rate
      modify_rate(employee)
    when 2
      # modify time in
      modify_in(employee)
    when 3
      # modify time out
      modify_out(employee)
    when 4
      # modify day type
      modify_type(employee)
    when 5
      # exit
      is_terminated = true
    end
  end
end

# this method modifies the daily rate
def modify_rate(employee)
  Display.modify_rate
  puts "| Current: #{employee.daily_rate}"
  puts "+---------------------------+"
  puts

  print 'Enter Value: '
  value = gets.chomp.to_f
  employee.set_rate(value)
end

# this method modifies the time in
def modify_in(employee)
  Display.modify_in
  puts "| Current: #{employee.time_in}"
  puts "+---------------------------+"
  puts

  print 'Enter Value: '
  value = gets.chomp.to_i
  employee.set_in_time(value)
end

# this method modifies the time out
def modify_out(employee)
  Display.modify_out
  puts "| Current: #{employee.time_out}"
  puts "+---------------------------+"
  puts

  print 'Enter Value: '
  value = gets.chomp.to_i
  employee.set_out_time(value)
end

# this method modifies the day type
def modify_type(employee)
  Display.modify_type
  puts "| Current: #{employee.day_type}"
  puts "+---------------------------+"
  puts "| [1] Normal Day            |"
  puts "| [2] Rest Day              |"
  puts "| [3] Special Non-Working   |"
  puts "| [4] Special Non-Working   |"
  puts "|     and Rest Day          |"
  puts "| [5] Regular Holiday       |"
  puts "| [6] Regular Holiday       |"
  puts "|     and Rest Day          |"
  puts "+---------------------------+"
  puts

  print 'Enter Type: '
  value = gets.chomp.to_i

  case value
  when 1
    # set day type to normal day
    employee.set_day_type('Normal Day')
  when 2
    # set day type to rest day
    employee.set_day_type('Rest Day')
  when 3
    # set day type to special non-working
    employee.set_day_type('Special Non-Working')
  when 4
    # set day type to special non-working and rest day
    employee.set_day_type('Special Non-Working and Rest Day')
  when 5
    # set day type to regular holiday
    employee.set_day_type('Regular Holiday')
  when 6
    # set day type to regular holiday and rest day
    employee.set_day_type('Regular Holiday and Rest Day')
  end
end

is_terminated = false

until is_terminated
  Display.main
  print 'Action: '
  action = gets.chomp.to_i

  if action > 3 || action < 1
    next
  end

  case action
  when 1
    generate_weekly_payroll(employee)
  when 2
    # generate payroll for each day of the week
    # for each day, modify the configurations
    days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
    days.each do |day|
      modify_configurations(employee, day)
      generate_payroll(employee)
    end
  when 3
    Terminal.clear
    is_terminated = true
  end
end
