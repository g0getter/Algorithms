R, C = map(int, input().split())
grid = [list(input().split()) for _ in range(R)]

# 1. (1,1)과 (R, C) 반대 맞는지 확인 (정확히는 (0,0)과 (R-1, C-1))
# 2. 첫 번째 이동(i,j) 완전탐색: (1,1)~(R-3, C-3) 돌면서 (0,0) 반대 있는지 확인
# 3. 두 번째 이동 완전탐색: (i+1, j+1)~(R-2, C-2) 돌면서 (i,j) 반대 있는지 확인
#(두 번째 이동과 (R, C)는 비교할 필요 X. 1에서 보장하므로.)

def brute_force():
    count = 0

    def isOpposite(w_or_b):
        if w_or_b == "W": return "B"
        elif w_or_b == "B": return "W"

    if grid[0][0] != isOpposite(grid[R-1][C-1]):
        return 0 # 두 개가 같으면 애초에 성공 불가능

    for i in range(1, R-2):
        for j in range(1, C-2):
            if grid[i][j] == isOpposite(grid[0][0]):
                for l in range(i+1, R-1):
                    for k in range(j+1, C-1):
                        if grid[l][k] == isOpposite(grid[i][j]):
                            count += 1

    return count

print(brute_force())