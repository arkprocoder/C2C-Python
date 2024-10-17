# def rotation(mystr):
#     last_char= mystr[-1]
#     exclude_last_char=mystr[:len(mystr)-1] 
#     return last_char+exclude_last_char
# print(rotation("GUVI"))
# print(rotation("INDIA"))
# print(rotation("Infosys"))


def rotation(s1, s2):
    if len(s1) != len(s2):
        return False
    # s1= GUVIGUVI : s2=IGUV
    # s1=InfosysInfosys s2=snfosyI
    # s1=INDIAINDIA s2=ANDIA
    return s2 in s1 + s1



print(rotation("GUVI","IGUV"))




print(rotation("INDIA","ANDIA"))
print(rotation("Infosys","snfosyI"))