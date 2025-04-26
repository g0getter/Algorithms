import sys

abilities = list(map(int, input().split()))
n = len(abilities)

# 1. 팀1을 만들고 합 구함
    # 3명 뽑기: N^3 = 6^3
# 2. 전체합에서 빼고 그것과의 차이 구함 -> min 지정하는 업데이트
min_diff = sys.maxsize

for i in range(n):
    for j in range(i+1, n):
        for k in range(j+1, n):
            sum1 = abilities[i] + abilities[j] + abilities[k]
            sum2 = sum(abilities) - sum1
            min_diff = min(abs(sum1-sum2), min_diff)

print(min_diff)