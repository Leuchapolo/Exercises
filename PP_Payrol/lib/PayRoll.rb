class Payroll
	attr_accessor :total_pay
    def initialize(employees)
        @employees = employees
        @total_pay = 0
    end

 	def notify_employee(employee)
 		puts "Email Sent: " + "You, #{employee.name} were paid " + (employee.calculate_salary * 0.82).to_s
 	end

  def pay_employees
      # Should output how much we're paying each employee for this week and the total amount spent on payroll this week. 
  	@employees.each do |emp|

  		puts emp.name + " is recieving " + (emp.calculate_salary * 0.82).to_s
  		@total_pay += emp.calculate_salary * 0.82
  		#notify_employee(emp)

  	end
  end
end