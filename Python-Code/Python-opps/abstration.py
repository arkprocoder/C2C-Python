from abc import ABC, abstractmethod
import math

# abstract class
class Shape(ABC):

    guvi="compay"

    @abstractmethod
    def area(self):
        pass

    @abstractmethod
    def perimeter(self):
        pass

class Circle(Shape):
    def __init__(self,radius):
        self.radius=radius

    def area(self):
        return math.pi*self.radius*self.radius

    def perimeter(self):
        return 2*math.pi*self.radius
    
    def greet(self):
        pass

class Rectangle(Shape):

    def __init__(self,length,width):
        self.length=length
        self.width=width

  
    def area(self):
        return self.length*self.width

 
    def perimeter(self):
        return 2*self.length*self.width

obj1=Circle(5)


# smartphone abstract class
# camera,whatsapp,facebook,music player

# create phone and implemenet smartphone inside and achive the abstarction