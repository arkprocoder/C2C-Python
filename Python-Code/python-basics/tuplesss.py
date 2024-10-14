# # tuple-> immutable -> cannot change the value once assigned 
# mytup=(1,2,3,4,5,6)
# print(mytup,type(mytup))

# print(mytup[3])

# for i in mytup:
#     print(i)

# # mytup[2]=13

# print(mytup.index(3))
# # print(mytup.index(13))
'''Write a Python program that takes a list of tuples as input and finds the student with the highest score and the student with the lowest score.
Input list of tuples (name, score)
studentscores = [('Alice', 92), ('Bob', 78), ('Charlie', 65), ('David', 88)]
Your program should find and print the names of the highest and lowest scoring students
Expected output: Highest Scorer: Alice, Lowest Scorer: Charlie'''
studentscores = [('Alice', 92), ('Bob', 78), ('Charlie', 65), ('David', 88)]
highestscore=-1
lowest_score=float('inf')
print(float('inf'))
highest_scorer=""
lowest_scorer=""

for name,score in studentscores:
    if score>highestscore:
        highestscore=score
        highest_scorer=name
    if score<lowest_score:
        lowest_score=score
        lowest_scorer=name

print(highestscore,highest_scorer)
print(lowest_score,lowest_scorer)