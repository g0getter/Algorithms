N = int(input())
A = list(map(int, input().split()))

count = 0
# Solution 1: 정석대로 구현
# 1. 3개 선택, i < j < k 순으로
# 2. 키 비교, 맞으면 count +1
for i in range(N):
    for j in range(i+1, N):
        for k in range(j+1, N):
            if A[i] <= A[j] <= A[k]:
                count += 1

# Solution 2: 모듈 combinations 이용
# from itertools import combinations
# for ai, aj, ak in list(combinations(A, 3)):
#     if ai <= aj <= ak:
#         count += 1
        
print(count)