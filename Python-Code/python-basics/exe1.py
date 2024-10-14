# Evaluate mylist=[23,4,5,6,7,8,1,2,3,9,0,122,10,2,3,4,3,3,2]
# 1)write a python program to evaluate below list
# a)Add the items in list 
# b)Find the length of the list
# c)sort the elements from the list
# d)reverse the list
# e)Count the duplicates elements from the list (3,2)

# mylist=[23,4,5,6,7,8,1,2,3,9,0,122,10,2,3,4,3,3,2]
# mylist.append(15)
# print("a",mylist)
# print("length of list is ", len(mylist))
# mylist.sort()
# print("sorted list",mylist)
# mylist.reverse() #mylist=mylist.reverse()
# print(mylist.reverse())
# print("reverse list",mylist)
# print("Duplicate item 3",mylist.count(3))
# print("Duplicate item 2",mylist.count(2))

# mylist=[23,4,5,6,7,8,1,2,3,9,0,122,10,2,3,4,3,3,2]
# data=set(mylist)
# data=list(data)
# print(data)

# n= input("enter the values:\n")
# if n[::-1] == n:
#     print(f"{n} is palindrome")
# else:
#     print(f"{n} is not palindrome")

#Approch-1
n=input("Enter the input:")
if n==n[::-1]:
    print("palindrome")
else:
    print("not palindrome")
