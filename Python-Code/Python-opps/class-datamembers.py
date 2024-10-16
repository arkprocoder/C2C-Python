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
    
    @staticmethod
    def play():
        print("play")

    @classmethod
    def changeCompany(self,cls):
        self.company=cls
        print("i have change the company name")


Company.changeCompany("Infosys")
# create the objects
obj1=Company()
print(obj1.company)
print(obj1.since)

obj1.greet()
obj1.publicholidays()


# obj1.changeCompany("TCS")



obj2=Company()
obj2.employeename='rohan'


print(obj2.company)
print(obj2.since)

obj2.greet()
obj2.publicholidays()

print(obj2.employeename)
print(obj1.employeename)


obj1.play()