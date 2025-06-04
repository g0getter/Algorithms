import sys

n, k = map(int, input().split())
coins = [int(input()) for _ in range(n)]

# 전부 될 때까지 넣는다 - 뒤에서부터
current_sum = 0
coin_count = 0

## Solution1. 뒤에서 index로 접근, while 사용하기 때문에 직접 i 감소 필요, if q > 0 검증
# i = len(coins)-1
# while current_sum != k and i >= 0:
#     q = (k-current_sum) // coins[i] # 몫
#     if q > 0:
#         current_sum += coins[i] * q
#         coin_count += q
#         # print(current_sum, coins[i])
#     i -= 1


## Solution2. 뒤집은 배열에 순서대로 접근, 불필요한 if q > 0 검증 제외.
for coin in coins[::-1]:
    q = (k - current_sum) // coin
    current_sum += coin * q 
    coin_count += q
print(coin_count)