a = input()

# Solution1. 골라서 변경
def solution1():
    # number = 0
    answer = a[:len(a)-1]+"0"

    for i, num in enumerate(a):
        if num == "0":
            answer = a[:i]+"1"+a[i+1:]
            break
            # number = number * 2
        # else:
            
    return answer

def get_number(string):
    number = 0
    for digit in string:
        if digit == "1":
            number = number * 2 + 1
        else:
            number = number * 2

    return number

# Solution2. 완전 탐색

print(get_number(solution1()))