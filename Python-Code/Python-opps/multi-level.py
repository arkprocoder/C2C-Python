class Grandfather:

    def grands(self):
        print("grand father")

class Father(Grandfather):

    def father(self):
        print("father")

class Son(Father):
    def son(self):
        print("son")


class Son_of_son(Son):
    def sson(self):
        print("sson")


obj=Son_of_son()
obj.sson()
obj.son()
obj.father()
obj.grands()