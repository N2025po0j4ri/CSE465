def adder(*numbers):
    sum = 0
    for num in numbers:
        sum += num
    return sum
# The following code is printed here
print("\n")
print("Sum 1 is", adder(1,2,3,4,5,6))
print("Sum 2 is", adder(1,5))
print("Sum 3 is", adder())
print("\n")