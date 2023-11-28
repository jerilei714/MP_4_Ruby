# ********************
# Name: Jeri Lei Concepcion
# Language: Ruby
# Paradigm(s): Object Oriented Programming
# Group Number and Section:  Group 4 - S18
# ********************

# File: lib/Terminal.rb
# Purpose: Terminal class for handling terminal output
#          and input.

class Terminal
  def self.clear
    system('clear') || system('cls')
  end

  def self.buffer(message)
    puts
    print message
    gets.chomp
  end

  def self.success(message)
    puts "\033[32m\033[03m#{message}\033[00m"
  end

  def self.warning(message)
    puts "\033[30m\033[03m#{message}\033[00m"
  end

  def self.danger(message)
    puts "\033[31m\033[03m#{message}\033[00m"
  end
end
