class Employee:
    company="TCS"
    def __init__(self,name,age,role,salary):
        print("i am reading the values from the arguments")
        print("i am setting the data members")
        # set the contrutor
        self.name=name
        self.age=age
        self.role=role
        self.salary=salary
        print("i have completed")

    def greet(self):
        print("Good morning")

    def employeeDetails(self):
         return f"\nEmployee Details:\n Company name is {self.company}\nEmployee Name is {self.name}\nRole is {self.role}\nAge is {self.age}\nSalary is {self.salary}"

emp1=Employee("Rohan",25,"front end developer",25000)
emp2=Employee("Amrutha",25,"Product OWner",56000)

# print(emp1.name)
# print(emp2.name)
# print(emp1.salary,emp2.salary)

e1=emp1.employeeDetails()
e2=emp2.employeeDetails()

print(e1,e2)