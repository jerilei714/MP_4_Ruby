# ********************
# Name: Jeri Lei Concepcion
# Language: Ruby
# Paradigm(s): Object Oriented Programming
# Group Number and Section:  Group 4 - S18
# ********************


# File: Employee.rb
# Purpose: Employee class for handling employee data
#          and calculations.

class Employee
  ONE_HOUR = 100      # Constant for 1 hour
  EIGHT_HOURS = 800   # Constant for 8 hours
  NS_DIFF = 1.10      # Constant for night shift differential


  # automatic getter and setter methods
  attr_accessor :daily_rate, :time_in, :time_out, :day_type,
                :night_shift_hours, :regular_overtime, :night_overtime,
                :day_salary, :hours_worked, :weekly_salaries

  # constructor method
  def initialize
    @daily_rate = 500.0       # default daily rate
    @time_in = 900            # default time in
    @time_out = 900           # default time out
    @day_type = 'Normal Day'  # default day type
    @night_shift_hours = 0    # default night shift hours
    @regular_overtime = 0     # default regular overtime hours
    @night_overtime = 0       # default night overtime hours
    @day_salary = 0           # default day salary
    @hours_worked = 0         # default hours worked
    @weekly_salaries = []     # default weekly salaries
    calculate_hours           # calculate hours
  end

  # getter methods

  # method: get_weekly_salary
  # returns the sum of all weekly salaries
  def get_weekly_salary
    @weekly_salaries.sum
  end

  # setter methods

  # method: set_rate
  # set daily rate and calculate hours
  def set_rate(daily_rate)
    @daily_rate = daily_rate
    calculate_hours
  end

  # method: set_in_time
  # set time in and calculate hours
  def set_in_time(time_in)
    @time_in = time_in
    calculate_hours
  end

  # method: set_out_time
  # set time out and calculate hours
  def set_out_time(time_out)
    @time_out = time_out
    calculate_hours
  end

  # method: set_day_type
  # set day type and calculate hours
  def set_day_type(day_type)
    @day_type = day_type
    calculate_hours
  end

  # other methods

  def reset_hours
    @regular_overtime = @night_overtime = @night_shift_hours = @hours_worked = 0
  end

  # method: calculate_hours
  # calculate hours worked, night shift hours, regular overtime hours, and night overtime hours
  def calculate_hours

    reset_hours

    # 1. Calculate Hours Worked if time out is less than 6:00 AM
    if @time_out <= 600
      @hours_worked += (@time_out + 2400 - (@time_in + ONE_HOUR)) / 100
    end

    # 2. Calculate Hours Worked if time out is greater than 6:00 AM
    if @time_out > 600
      @hours_worked += (@time_out - (@time_in + ONE_HOUR)) / 100
    end

    # 3. Calculate Night Shift Hours if time out is less than 6:00 AM
    if @hours_worked <= 8 && @time_out < 600
      @night_shift_hours += (@time_out + 2400 - 2200) / 100
    end

    # 4. Calculate Night Shift Hours if time out is greater than 10:00 PM (basically, if 11:00 PM)
    if @hours_worked <= 8 && @time_out > 2200
      @night_shift_hours += (@time_out - 2200) / 100
    end

    # 5. Calculate Night Overtime if time out is less than 6:00 AM
    if @hours_worked > 8 && @time_out < 600
      @night_overtime += (@time_out + 2400 - 2200) / 100
    end

    # 6. Calculate Night Overtime if time out is greater than 10:00 PM (basically, if 11:00 PM)
    if @hours_worked > 8 && @time_out > 2200
      @night_overtime += (@time_out - 2200) / 100
    end

    # 7. Calculate Regular Overtime if time out is less than or equal to 10:00 PM
    if @hours_worked > 8 && @time_out <= 2200 &&  @time_out > 600
      @regular_overtime += (@time_out - ((@time_in + ONE_HOUR) + EIGHT_HOURS)) / 100
    end

    # 8. Calculate Regular Overtime if time out is less than or equal to 11:00 PM
    if @hours_worked > 8 && (@time_out <= 600 || @time_out == 2300)
      @regular_overtime += (2200 - ((@time_in + ONE_HOUR) + EIGHT_HOURS)) / 100
    end

    # 9. If time in is equal to time out, then all hours are zero
    reset_hours if @time_in == @time_out

    # 10. Calculate Day Salary
    calculate_salary
  end

  # method: calculate_salary
  # calculate salary for the day
  def calculate_salary
    rates = {
      'Normal Day' => { rate: 1.0, overtime_rate: 1.25, night_rate: 1.375 },
      'Rest Day' => { rate: 1.3, overtime_rate: 1.69, night_rate: 1.859 },
      'Special Non-Working' => { rate: 1.3, overtime_rate: 1.69, night_rate: 1.859 },
      'Special Non-Working and Rest Day' => { rate: 1.5, overtime_rate: 1.95, night_rate: 2.145 },
      'Regular Holiday' => { rate: 2.0, overtime_rate: 2.6, night_rate: 2.86 },
      'Regular Holiday and Rest Day' => { rate: 2.6, overtime_rate: 3.38, night_rate: 3.718 }
    }

    self.day_salary = 0.0

    if day_type == 'Normal Day' && time_in == time_out
      self.day_salary = 0.0
    elsif ['Rest Day', 'Special Non-Working', 'Special Non-Working and Rest Day', 'Regular Holiday', 'Regular Holiday and Rest Day'].include?(day_type) && time_in == time_out
      self.day_salary = self.daily_rate
    else
      rate_info = rates[day_type]

      rate = rate_info[:rate]
      overtime_rate = rate_info[:overtime_rate]
      night_rate = rate_info[:night_rate]

      if self.night_shift_hours.positive?
        self.day_salary += (self.daily_rate * rate) + (self.night_shift_hours * self.daily_rate / 8 * NS_DIFF)
      end

      if self.regular_overtime.positive?
        self.day_salary += (self.daily_rate * rate) + (self.regular_overtime * self.daily_rate / 8 * overtime_rate)
      end

      if self.night_overtime.positive?
        self.day_salary += (self.night_overtime * self.daily_rate / 8 * night_rate)
      end

      if self.night_shift_hours.zero? && self.regular_overtime.zero? && self.night_overtime.zero?
        self.day_salary += self.daily_rate * rate
      end
    end
  end
end
