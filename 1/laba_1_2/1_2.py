print("This program raises the number 2 to the power of N.")
print("Enter number from interval [1;31]:")
try:
    N = int(input())
    if N < 1 or N > 31:
        raise Exception
    print(2 ** N)
except Exception:
    print("Check entered data (enter number from interval [1;31]).")
