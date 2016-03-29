require_relative "Employee.rb"

class MultiPaymentEmployee < Employee
	def initialize(name, email, annual_salary, hourly_rate, hours_worked)
        @name = name
        @email = email
        @annual_salary = annual_salary
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary

      total_sal = @annual_salary/52
      if @hours_worked > 40
      	total_sal += ((@hours_worked - 40) * @hourly_rate)
      end
    end


end
