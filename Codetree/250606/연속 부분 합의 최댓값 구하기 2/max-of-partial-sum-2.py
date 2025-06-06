n = int(input())
a = list(map(int, input().split()))

# 이전 것보다 작아지면 끊고 새로 시작 ? X. 4, -1, 2면 전부 합친 게 최대
# -> 이전의 부분합이 음수되면 끊고 새로 시작. 본인과 합쳤을 때 무조건 손해이므로.

max_sum = -1000

current_sum = 0 # 부분합
for num in a:
    # (i)
    current_sum = max(current_sum + num, num) # 직전 최대 부분합을 연장 or 본인으로 초기화
    
    # or

    # (ii)
    # if current_sum < 0:
    #     current_sum = num # 전부 음수인 경우도 확인
    # else:
    #     current_sum += num

    max_sum = max(max_sum, current_sum)

print(max_sum)