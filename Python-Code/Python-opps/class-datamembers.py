class Company:
    # data members of the class
    company="guvi"
    since=2014
    employeename=None

    #methods
    def greet(self):
        print("Good morning",self.company)

    def publicholidays(self):
        print("guvi has 10 public holidays")
    

# create the objects
obj1=Company()
print(obj1.company)
print(obj1.since)

obj1.greet()
obj1.publicholidays()

obj2=Company()
obj2.employeename='rohan'
print(obj2.company)
print(obj2.since)

obj2.greet()
obj2.publicholidays()

print(obj2.employeename)
print(obj1.employeename)


