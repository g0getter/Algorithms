n = int(input())
grid = [list(map(int, input().split())) for _ in range(n)]

# Please write your code here.
def count_coins(r, c):
    count = 0
    if r + 2 >= n or c + 2 >= n:
        return -1

    for i in range(r, r+3):
        for j in range(c, c+3):
            if grid[i][j] == 1: count += 1

    return count

coins = []
for i in range(n):
    for j in range(n):
        if i + 2 >= n or j + 2 >= n:
            continue # break도 가능할 것
        coins.append(count_coins(i, j))
    
print(max(coins))
