n, m = map(int, input().split())
grid = [list(map(int, input().split())) for _ in range(n)]

def calculate_cost(k):
    return k * k + (k + 1) * (k + 1)

# 금 위치 저장
gold_positions = []
for i in range(n):
    for j in range(n):
        if grid[i][j] == 1: gold_positions.append((i,j))

max_gold_count = 0

for k in range(2 * n):  # 0 ~ n-1 말고 2n까지(?!)
    for i in range(n):
        for j in range(n):
            gold_count = 0
            for x, y in gold_positions:
                if abs(x-i) + abs(y-j) <= k: # distance from (x, y) to (i, j)
                    gold_count += 1

            if gold_count * m - calculate_cost(k) >= 0:
                max_gold_count = max(max_gold_count, gold_count)

print(max_gold_count)