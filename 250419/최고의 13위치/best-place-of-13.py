n = int(input())
grid = [list(map(int, input().split())) for _ in range(n)]

# 왼쪽 격자 기준으로 완전 탐색
max_count = 0
for i in range(n):
    for j in range(n-2):
        # 동전 개수 세기
        max_count = max(grid[i][j] + grid[i][j+1] + grid[i][j+2], max_count)

print(max_count)