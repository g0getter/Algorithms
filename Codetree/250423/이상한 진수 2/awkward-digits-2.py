a = input()

# Solution1. 골라서 변경
def solution1():
    answer = a[:-1]+"0"

    for i, num in enumerate(a):
        if num == "0":
            answer = a[:i]+"1"+a[i+1:]
            break
            
    return answer

def convert_binary_to_decimal(string):
    number = 0
    for digit in string:
        number = number * 2 + int(digit)

    return number

# Solution2. 완전 탐색


print(convert_binary_to_decimal(solution1()))