# ********************
# Name: Jeri Lei Concepcion
# Language: Ruby
# Paradigm(s): Object Oriented Programming
# Group Number and Section:  Group 4 - S18
# ********************

# File: Display.rb
# Purpose: Display the main menu and configurations menu
#          for the user to interact with.
class Display
  def self.main
    header
    puts "| [1] Generate Weekly Payroll            |"
    puts "| [2] Modify Configurations (Whole Week) |"
    puts "| [3] Exit Program                       |"
    puts "+----------------------------------------+"
    puts
  end

  def self.configurations
    current
    puts "| [1] Daily Rate                         |"
    puts "| [2] Time In                            |"
    puts "| [3] Time Out                           |"
    puts "| [4] Day Type                           |"
    puts "| [5] Enter                              |"
    puts "+----------------------------------------+"
    puts
  end

  def self.modify_rate
    Terminal.clear
    puts "+---------------------------+"
    puts "| Modifying Daily Rate...   |"
  end

  def self.modify_in
    Terminal.clear
    puts "+---------------------------+"
    puts "| Modifying Time In...      |"
  end

  def self.modify_out
    Terminal.clear
    puts "+---------------------------+"
    puts "| Modifying Time Out...     |"
  end

  def self.modify_type
    Terminal.clear
    puts "+---------------------------+"
    puts "| Modifying Day Type...     |"
  end

  private

  def self.header
    Terminal.clear
    puts "+----------------------------------------+"
    puts "|          Weekly Payroll System         |"
    puts "|             in Ruby by jeri            |"
    puts "+----------------------------------------+"
  end

  def self.current
    Terminal.clear
    puts "+----------------------------------------+"
    puts "|         Which one would you like       |"
    puts "|               to modify?               |"
    puts "+----------------------------------------+"
  end
end
