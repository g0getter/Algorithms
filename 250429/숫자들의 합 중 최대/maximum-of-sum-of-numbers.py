X, Y = map(int, input().split())

max_sum = 0

# Solution1: 각 자리 숫자의 합 구할 때 반복문 사용
# for num in range(X, Y+1):
#     sum = 0
#     digits = map(int, list(str(num)))
#     # print(list(digits)) # list로 변환해야 출력 가능
#     for digit in digits:
#         sum += digit
#     max_sum = max(max_sum, sum)

# Solution2: 각 자리 숫자의 합 구할 때 재귀 사용
def get_digit_sum(num):
    # e.g. 123 -> 12/3 (앞의 결과 + 일의 자리의 수)
    if num < 10:
        return num
    else:
        return get_digit_sum(num//10) + num % 10
        
for num in range(X, Y+1):
    max_sum = max(max_sum, get_digit_sum(num))

print(max_sum)
