n = int(input("Enter a number: "))

result = ""
if n % 3 == 0:
    result += "Fizz"
if n % 5 == 0:
    result += "Buzz"

print(result if result else "Not a FizzBuzz number")
