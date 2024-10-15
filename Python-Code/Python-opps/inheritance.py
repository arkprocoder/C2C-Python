# Inheritance-single, multilevel, multiple
class Parent:
    family_name="gowdas"

    def property(self):
        print("Parent property")
    
    def business(self):
        print("Parent Business")

class Child(Parent):
    childname='chandan'

    def car(self):
        print("Car is Swift")
    
    def business(self):
        print("child business")

obj=Child()
obj.property()
obj.car()
obj.business()