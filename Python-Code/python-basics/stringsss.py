mystr="welcome to day-3 Session on Python"
print("Uppercase",mystr.upper())
print("Lowercase",mystr.lower())
# mystr=mystr.upper()
# print(mystr)
print("index",mystr.index('day'))

print("capitalize",mystr.capitalize())

print("count",mystr.count('o'))
print("count",mystr.count('Python'))
print("count",mystr.count(' '))
print("find",mystr.find('o'))
print("find",mystr.find('one'))
print("startswith",mystr.startswith("Welcome"))
print("endswith",mystr.endswith("Python"))
print("length",len(mystr))
print(mystr.replace("Python","Python Programming"))
data=mystr.split()
print(data)