# operator overloading and dunder methods in python

class Employee:
    no_of_leaves=14
    def __init__(self,name,salary,role,phone):
        self.name=name
        self.salary=salary
        self.role=role
        self.phone=phone
    
    @classmethod
    def change_of_leaves(self,n):
        self.no_of_leaves=n

    
    @staticmethod
    def Company():
        print("i am Guvi")

    def __str__(self):
        return self.name
    
    def __repr__(self):
        return f"Employee Name is {self.name}\nSalary {self.salary}\nRole {self.role}\nPhone Number is {self.phone} No of Leave {self.no_of_leaves} \n repr method"
    

    def __add__(emp1,emp2):
        return emp1.salary+emp2.salary
    
    def __mul__(emp1,emp2):
        return emp1.salary*emp2.salary
    
    def __truediv__(emp1,emp2):
        return emp1.salary/emp2.salary
    
    def __floordiv__(emp1,emp2):
        return emp1.salary//emp2.salary
    
e1=Employee("Anees",50000,"full stack mentor",785496578)
print(e1.no_of_leaves)
e1.change_of_leaves(25)
print(e1.no_of_leaves)
e2=Employee("Rohan",30000,"full stack mentor",785496578)
print(e2.no_of_leaves)
print(e1)
print(e2)
print(e1+e2)
print(e1*e2)
print(e1/e2)
print(e1//e2)

