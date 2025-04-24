n, k = map(int, input().split())
x = []
c = []
for _ in range(n):
    pos, char = input().split()
    x.append(int(pos))
    c.append(char)

# 1. 배열 생성 (크기 10000+1)
# 2. 현 상태 따라 배열 채움 (e.g. [0, G, H, 0, ...])
# 3. k크기 틀을 i=1부터 i=10000-k까지 돌림  (e.g. 1부터 2까지)
# 4. 돌리면서 내부 점수 계산, 최댓값 매번 업데이트

def calc_score(start_index):
    score = 0
    for i in range(start_index, start_index+k+1):
        if state[i] == "G":
            score += 1
        elif state[i] == "H":
            score += 2

    return score

#1
state = [0 for _ in range(10000+1)]

#2
# x: position(int) e.g. [4, 10,8, 7,..]
# c: character("G"or"H") e.g. [G,H.]
for i, position in enumerate(x):
    state[position] = c[i]


# 3. k크기 틀을 i=1부터 i=10000-k까지 돌림  (e.g. 1부터 9999까지)
# 4. 돌리면서 내부 점수 계산, 최댓값 매번 업데이트
max_score = 0
for start_i in range(1, 10000-k+1):
    max_score = max(max_score, calc_score(start_i))

print(max_score)