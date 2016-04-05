require_relative "Employee.rb"
require_relative "Hourly_Pay.rb"

class HourlyEmployee < Employee
	include HourlyPay 

    def initialize(name, email, hourly_rate, hours_worked)
        @name = name
        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      calculate_hourly(@hours_worked, @hourly_rate)

    end

end
