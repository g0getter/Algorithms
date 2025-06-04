import sys

n, k = map(int, input().split())
coins = [int(input()) for _ in range(n)]

# 전부 될 때까지 넣는다 - 뒤에서부터
current_sum = 0
coin_count = 0

i = len(coins)-1
while current_sum != k and i >= 0:
    q = (k-current_sum) // coins[i] # 몫
    if q > 0:
        current_sum += coins[i] * q
        coin_count += q
        # print(current_sum, coins[i])
    i -= 1

print(coin_count)






