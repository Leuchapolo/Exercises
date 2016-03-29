require_relative("lib/HourlyEmployee.rb" )
require_relative( "lib/MultiPaymentEmployee.rb")
require_relative  "lib/SalariedEmployee.rb"
require_relative "lib/Employee.rb"
require_relative "lib/PayRoll.rb"

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)

nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)

ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)

rick = HourlyEmployee.new("Ricardo", 'ricky@martin.com', 15, 6)

mike = HourlyEmployee.new("Michael", "leucha@gmail.com", 15, 80)

employees = [josh, nizar, ted, mike, rick]

payroll = Payroll.new(employees)
payroll.pay_employees


