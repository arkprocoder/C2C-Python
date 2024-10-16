class Animal:
    def speak(self):
        print("Animal doesnt speaks")

class Dog(Animal):
    def speak(self):
        print ("Dog Barks")

class Cat(Animal):
    def speak(self):
        print("Cat meows")
    

obj=Cat()
obj.speak()