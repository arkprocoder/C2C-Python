def tax(eSalary):
    taxreturns=(eSalary*10)/100
    return taxreturns

company='Infosys'
def employeeDetails(ename,erole,esalary):
    # company='TCS'
    taxAmount=tax(esalary)
    salary=esalary-taxAmount
    print(f"\nCompany name is {company}\nEmployee name is {ename}\nEmployee Role is {erole}\nGross Salary : {salary} Rs\nTax deducted : {taxAmount} Rs")


employeeDetails('rahul','Developer',25000)
employeeDetails('a','Developer',569875)
employeeDetails('b','Developer',3698745)
employeeDetails('c','Developer',69874562)
