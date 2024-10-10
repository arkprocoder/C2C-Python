company='Infosys'
def employeeDetails(ename=None,erole=None,esalary=None):
    # company='TCS'
    print(f"\nCompany name is {company}\nEmployee name is {ename}\nEmployee Role is {erole}\nSalary is {esalary}")

employeeDetails('Rohan','Developer')
employeeDetails('rahul','Developer',25000)