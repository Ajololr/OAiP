print("This progr1am calculates the square root of X. Enter X [0;2147483647]:")
X = float(input())
Y = 1.00000001
Count = 0
while Y - (X + Y * Y) / (2 * Y) > 2 :
    Y = (X + Y * Y) / (2 * Y)
    Count += 1
print(Y, "Number of iterations:", Count)        
