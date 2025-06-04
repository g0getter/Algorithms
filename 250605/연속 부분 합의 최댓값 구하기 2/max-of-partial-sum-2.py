n = int(input())
a = list(map(int, input().split()))

# 이전 것보다 작아지면 끊고 새로 시작 ? X. 4, -1, 2면 전부 합친 게 최대
# -> 합이 음수되면 끊고 새로 시작. 다음 것과 합쳤을 때 이득이 아님(?)

max_sum = -1000

current_sum = 0
for num in a:
    if current_sum + num < 0:
        current_sum = num # 전부 음수인 경우도 확인
    else:
        current_sum += num
    max_sum = max(max_sum, current_sum)
    # print(num, current_sum, max_sum)

print(max_sum)