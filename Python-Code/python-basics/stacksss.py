# LIFO-Stack

# stack=["chandu","vinay","nagurjuna","aditya"]

stack=[]
for i in range(1,5):
    n=int(input("Enter the element to insert into stack:\n"))
    print(f"{n} is inserted")
    stack.append(n)
    print("Top ",stack[-1])

print("original stack",stack)

while True:
    n=int(input("\nEnter 1 for pop operation\nEnter 2 for to check stack is empty or not\nEnter 3 to stop:\n"))
    if(n==1):

        try:
            stack.pop()
            print("After pop stack is ",stack)
        except Exception as e:
            print("Stack Underflow")
    elif(n==2):
        if not stack:
            print("stack is empty")
        else:
            print(f"stack is {stack}")
    elif(n==3):
        break