n = int(input())
grid = [list(map(int, input().split())) for _ in range(n)]

# 1. (0,0)부터 시작
#   - 끝점(가로, 세로 모두)이 넘지 않으면,
#   - 개수 세어 max 확인
# 2. 끝까지 가고 max 출력 
def count_coins(r, c):
    count = 0
    if r + 2 >= n or c + 2 >= n: # 기능 분리 위한 의도적 반복
        return -1

    for i in range(r, r+3):
        for j in range(c, c+3):
            if grid[i][j] == 1: count += 1

    return count

max_coin = 0
for i in range(n):
    for j in range(n):
        if i + 2 >= n or j + 2 >= n:
            continue # break도 가능하지만 헷갈릴 수 있음
        max_coin = max(count_coins(i, j), max_coin)
    
print(max_coin)
