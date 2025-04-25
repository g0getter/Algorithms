N = int(input())
a, b, c = map(int, input().split())

# 전체 탐색, 해당 조건 만족 개수 세기 => 시간 복잡도 만족 게산 어떻게?
count = 0
for i in range(1, N+1):
    for j in range(1, N+1):
        for k in range(1, N+1):
            if abs(i-a) <= 2 or abs(j-b) <= 2 or abs(k-c) <= 2:
                count += 1

print(count)