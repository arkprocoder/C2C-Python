# def A():
#     name='ark'
#     role='dev'
#     return name,role

# name,role =A()
# print(name,role)

def mydata():
    fruits=['apple','banana','orange',[100,2,3]]
    return fruits


def res():
    data=mydata()
    print(data[2],data[3][0])

res()