require_relative "Employee.rb"

class SalariedEmployee < Employee
 
	
    def initialize(name, email, annual_salary)
        @name = name
        @email = email
        @annual_salary = annual_salary
    end

    def calculate_salary
      #returns the hours worked * hourly_rate
      salary = @annual_salary/52
    end
end
