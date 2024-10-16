# class A():
#     def show(self):
#         print("A")

# class B(A):
#     def showB(self):
#         print("B")

# class C(A):
#     def showC(self):
#         print("C")

# class D(B,C):
#     def showD(self):
#         print("D")


# objd=D()
# objd.show()
# objd.showB()
# objd.showC()
# objd.showD()

# parent class 1
class Father:
    def __init__(self,name):
        self.name=name
        print("constructor - father")

    def provide(self):
        return f"{self.name} provides for the family..."
    
# parent class-2
class Mother:
    def __init__(self,name):
        self.name=name
        print("constructor - mother")

    def nurture(self):
        return f'{self.name} nurtures the children'

# child class inherits from both father and mother class & achives the multiple inheritance
class Child(Father,Mother):
    def __init__(self, name):
        # super().__init__(name)
        Father.__init__(self,name)
        Mother.__init__(self,name)
        print("constructor - children")


    def play(self):
        return f'{self.name} plays with friends'  
    


# create the object for the class child
ark=Child("ARK")

print(ark.provide())
print(ark.nurture())
print(ark.play())