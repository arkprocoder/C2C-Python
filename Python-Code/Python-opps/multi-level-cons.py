# multi level inheritance with constructor
class Company: #base class or parent class
    # initializing the constructor
    def __init__(self,name,location,dcbranch):
        # setting the values
        self.name=name
        self.location=location
        self.dcbranch=dcbranch
        print("I have set the values for class Company")

    def companyDetails(self):
        return f"\nCompany Name is {self.name}\nCompany located at {self.location}\nDc Branch {self.dcbranch}"

# archive the single level inheritance

class Employee(Company):

    # initalizing the constructor to child class or derived class
    def __init__(self,name,location,dcbranch,empid,employeeName,employeeRole):
        # setting the values for child class
        super().__init__(name,location,dcbranch) # this  is calling the class companys constructor method to set the values for name ,location,dcbranch
        self.empid=empid
        self.employeeName=employeeName
        self.employeeRole=employeeRole
        print("I have set the values for class Employee")

    def employeeDetails(self):
        return f"\nCompany Name is {self.name}\nCompany located at {self.location}\nDc Branch {self.dcbranch}\nEmployee Id is {self.empid}\nEmployee Name is {self.employeeName}\nEmployee Role is {self.employeeRole}"
    
# archive the multi level inheritance
class Manager(Employee):
    
    def __init__(self,name,location,dcbranch,empid,employeeName,employeeRole,department,managerName):
        # setting the values for child class
        super().__init__(name,location,dcbranch,empid,employeeName,employeeRole)# this  is calling the class Employee constructor method to set the values for empid,employeeName,employeeRole along with this it will call the class company constructors to set the values name,location,dcbranch
        self.department=department
        self.managerName=managerName
        print("I have set the values for class Manager")


    def employeeFullDetails(self):
        return f"\nCompany Name is {self.name}\nCompany located at {self.location}\nDc Branch {self.dcbranch}\nEmployee Id is {self.empid}\nEmployee Name is {self.employeeName}\nEmployee Role is {self.employeeRole}\nEmployee Department {self.department} \n Employee Manager {self.managerName}"
    


obj1=Manager("Guvi","Chennai","IIT Madras","guvi789","ANees","FUll stack mentor","Teaching Code","Rohan")
print("\n")

print(obj1.companyDetails())
print(obj1.employeeDetails())
print(obj1.employeeFullDetails())