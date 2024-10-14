mydict={
    "employeeName":"Anees",
    "employeeRole":"Full stack developer",
    "since":2020,
    "salary":50000.25,
    "skills":["python","java","react","angular"],
    "interest":{"cricket","gym","teaching"},
    "isActive":True

}

# print(mydict.get("interest"))
# print(mydict.get("isActive"))
# print(mydict.get("s"))

# print(mydict.values())
# print(type(mydict.values()))
# print(mydict.keys())
# print(type(mydict.keys()))

# mydict.update(

#     {
#       "since":2017,
#       "phone":9999999999  
#     }
# )

# print(mydict)

# mydict2=mydict.copy()

# # print(mydict2)

# mydict2.clear()
# print(mydict2)


# for key,val in mydict.items():
#     print(key,val)


country={
    "countryCode":"In",
    "country":"india",
    "state":{
        "stateName1":"karnataka",
        "district1":{
            "districtName":"bengaluru",
            "location":"Bengaluru",
        },
        "stateName2":"TamilNadu",
        "district2":{
            "districtName":"chennai",
            "location":"IIT Madras",
        }
        
    }

}

print(country.get("state").get("stateName1"))
print(country.get("state").get("district1").get("location"))