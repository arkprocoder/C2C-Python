'''
1 .Take a inputs and Evaluate the expressions
a)Take the Students name
b)Take the student English marks
maths, science, social, tamil, hindi while taking the inputs it should be in the range (0-100)
c)calculate the % and print
% <35% print fail and print the Grade 'F'
% >=35% and <55% print just pass and print the Grade 'D'
% >=55% and <60% print  pass and print the Grade 'C'
% >=60% and <75% print  average and print the Grade 'B'
% >=75% and <90% print  good and print the Grade 'A'
% >=90% and <100% print  excellent  and print the Grade 'A+'

'''

# inp=input("enter :\n")
# inp=set(input("enter :\n"))
# print(type(inp))

# a=1
# a=bool(a)
# print(a,type(a))

studentName=input("Enter the student Name:\n")
print("Enter Your Marks:")
english=int(input("Enter Your english Marks\n"))    
maths=int(input("Enter Your maths Marks\n"))
science=int(input("Enter Your science Marks\n"))
social=int(input("Enter Your social Marks\n"))
tamil=int(input("Enter Your tamil Marks\n"))
hindi=int(input("Enter Your hindi Marks\n"))

if(english<0 or english>100 or maths<0 or maths>100 or science<0 or science>100 or social<0 or social>100 or tamil<0 or tamil>100 or hindi<0 or hindi>100):
    print("Please Give the marks between 0-100")
else:
    sum=english+maths+science+social+tamil+hindi
    avg=sum/6
    
    if(avg<35):
        print("You are Failed Your % is ",avg," Grade 'F'")
    
    elif(avg>=35 and avg<55):
        print("You are Pass Your % is ",avg," Grade 'D'")

    elif(avg>=55 and avg<60):
        print("You are Pass Your % is ",avg," Grade 'C'")

    elif(avg>=60 and avg<75):
        print("You are Pass with Average Marks Your % is ",avg," Grade 'B'")

    elif(avg>=75 and avg<90):
        print("You are Pass with Good Marks Your % is ",avg," Grade 'A'")
    
    else:
        print("You are Pass with Excellent Marks Your % is ",avg," Grade 'A+'")