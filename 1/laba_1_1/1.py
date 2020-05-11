print("Enter your age:")
try:
    age = int(input())
    if age < 1 or age > 150:
        raise Exception
    if age > 17:
        print("You are allowed to vote")
    else:
        Age = 18 - age
        print("You will be allowed to vote in ", Age, "years")
except Exception :
    print("Check entered data")
