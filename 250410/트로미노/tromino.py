n, m = map(int, input().split())
grid = [list(map(int, input().split())) for _ in range(n)]

# Please write your code here.
shapes = [
    [(0,0), (0,1), (1,0)],
    [(0,0), (0,1), (1,1)],
    [(0,1), (1,0), (1,1)],
    [(0,0), (1,0), (1,1)],
    [(0,0), (0,1), (0,2)],
    [(0,0), (1,0), (2,0)]
]

def iterate_grid(shape): # shape: [(0,0), (0,1), (1,0)]
    max_sum = 0
    # grid 돌면서, 자기 기준 shape 세개의 합 확인
    for i in range(n):
        for j in range(m):
            sub_sum = 0
            for dx, dy in shape: # (0,0)
                if i + dx >= n or j + dy >= m:
                    break # 이번 shape은 글렀음
                sub_sum += grid[i+dx][j+dy] # 괜찮으면 합침
            # 셋 다 정상이었다면
            max_sum = max(max_sum, sub_sum) # 비교

    return max_sum

max_total_sum = 0
for shape in shapes:
    max_total_sum = max(max_total_sum, iterate_grid(shape))

print(max_total_sum)