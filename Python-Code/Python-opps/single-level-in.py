class Company:
    def __init__(self,name,location,dcbranch):
        print("Company constructor starts")
        self.name=name
        self.location=location
        self.dcbranch=dcbranch
        print("Company Contructor is set")

    
    def companyDetails(self):
        return f"\ncompany name is {self.name}\nlocation {self.location}\nBranch is {self.dcbranch}"
    
class Employee(Company):
    def __init__(self, name, location, dcbranch,employeename,erole,esalary):
        print("setting the values")
        super().__init__(name, location, dcbranch)
        print("Employee constructor starts")
        self.employeename=employeename
        self.erole=erole
        self.esalary=esalary
        print("Employee constructor is set")

    def employeeDetails(self):
        return f"\nCompany name {self.name}\n{self.location}\n{self.dcbranch}\n Employee details:\n{self.employeename}\n{self.erole}\n{self.esalary}"

e1=Employee("TCS","bangalore",'Ec city','vinay','developer',54000)
print(e1.companyDetails())
print(e1.employeeDetails())