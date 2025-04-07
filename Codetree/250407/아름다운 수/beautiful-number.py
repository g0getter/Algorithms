n = int(input())

# Brute-force
# 1. 모든 가능한 자릿수 생성
# 2. 각각이 아름다운 수인지 판별
# [아름다운 수 판별법]
# 각 자리를 돌면서, 그 자리 숫자 k에 대해
# 1. stack 확인
# 2. if 비었 -> stack에 k를 k개 추가
# 3. stack.popLast(), k와 같은지 확인
#    1) k와 같 -> 계속함
#    2) k와 안 같 -> return false
# prefix에 1~4 하나씩 붙이는 함수

def append_a_number(prefix):
    return [f"{prefix}{i}" for i in range(1,5)]

def all_numbers():

    result = [""]

    while len(result[0]) < n:
        temp = result
        result = []
        for prefix in temp:
            result += append_a_number(prefix)

    return result


# 1. 모든 가능한 자릿수 생성
nums = all_numbers()
count = 0

# 2. 각각이 아름다운 수인지 판별
# [아름다운 수 판별법]
# 각 자리를 돌면서, 그 자리 숫자 k에 대해
# 1. stack 확인
# 2. if 비었 -> stack에 k를 k개 추가
# 3. stack.popLast(), k와 같은지 확인
#    1) k와 같 -> 계속함
#    2) k와 안 같 -> return false
# prefix에 1~4 하나씩 붙이는 함수
def is_beautiful_number(number):
    stack = []

    for char in number:
        k = int(char)
        if len(stack) == 0:
            for _ in range(k):
                stack.append(k)
        
        last_num = stack.pop()
        if last_num != k:
            return False

    return len(stack) == 0

for num in nums:
    if is_beautiful_number(num):
        count += 1

print(count)
