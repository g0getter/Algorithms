N = int(input())
A = list(map(int, input().split()))

# 1. 3개 선택, i < j < k 순으로
# 2. 키 비교, 맞으면 count +1
count = 0
for i in range(N):
    for j in range(i+1, N):
        for k in range(j+1, N):
            if A[i] <= A[j] <= A[k]:
                count += 1

print(count)