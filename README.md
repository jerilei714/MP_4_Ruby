# Employee Payroll System

A Ruby-based employee payroll management system that calculates daily and weekly salaries with support for night shift differentials and overtime calculations.

## Overview

This program automates payroll processing for employees by:
- Tracking daily work hours and time entries
- Calculating regular and night shift overtime
- Applying night shift differentials (1.10x multiplier)
- Generating daily and weekly payroll summaries
- Providing an interactive menu for configuration management

## Project Structure

- **Main.rb** - Entry point and program flow controller
- **Employee.rb** - Employee class for managing employee data and payroll calculations
- **Display.rb** - Menu and display formatting for the user interface
- **Terminal.rb** - Terminal utility class for clearing screens and colored output

## Features

### Employee Management
- Store and manage employee information (daily rate, work hours)
- Track time in and time out
- Classify day types (Normal Day, Special Holiday, etc.)
- Calculate hours worked including night shift and overtime

### Payroll Calculations
- **Daily Rate**: Base hourly compensation
- **Night Shift Hours**: Hours worked between specific night hours
- **Regular Overtime**: Additional hours beyond standard 8-hour day
- **Night Overtime**: Overtime hours during night shift with differential
- **Weekly Salary**: Accumulated daily salaries for the week

### User Interface
- Interactive menu system for payroll generation
- Configuration management for modifying employee settings
- Formatted terminal output with aligned data display
- Color-coded console messages (success, warning, danger)

## Usage

Run the program:
```bash
ruby Main.rb
```

### Menu Options
1. **Generate Weekly Payroll** - Display current payroll calculations
2. **Modify Configurations** - Update employee settings like:
   - Daily Rate
   - Time In
   - Time Out
   - Day Type
3. **Exit Program** - Quit the application

## Technical Details

### Constants (Employee.rb)
- `ONE_HOUR = 100` - 1-hour time unit constant
- `EIGHT_HOURS = 800` - Standard 8-hour workday constant
- `NS_DIFF = 1.10` - Night shift pay differential multiplier

### Key Classes

#### Employee
Manages employee data with automatic calculations:
- `initialize` - Set default employee values
- `get_weekly_salary` - Calculate total weekly earnings
- `calculate_hours` - Determine hours worked and overtime

#### Display
Provides formatted UI menus and prompts for user interaction

#### Terminal
Utility methods for terminal operations:
- `clear()` - Clear console screen
- `buffer(message)` - Display prompt and capture input
- `success(message)` - Print green success message
- `warning(message)` - Print dark warning message
- `danger(message)` - Print red danger message

## Author
Jeri Lei Concepcion  
Group 4 - Section S18

## Language & Paradigm
- **Language**: Ruby
- **Paradigm**: Object-Oriented Programming (OOP)
