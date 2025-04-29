X, Y = map(int, input().split())


max_sum = 0
for num in range(X, Y+1):
    sum = 0
    digits = map(int, list(str(num)))
    # print(list(digits)) # list로 변환해야 출력 가능
    for digit in digits:
        sum += digit
    max_sum = max(max_sum, sum)

print(max_sum)