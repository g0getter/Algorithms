n = int(input())
moves = [tuple(map(int, input().split())) for _ in range(n)]# [(1, 2, 1)],...

# 1, 2, 3 경우 전부 시도
# bool 가진 List 생성, 흐름 그대로 구현

max_score = 0
for i in range(1,4):
    cups = [0] * 4 # 1, 2, 3번 종이컵 그대로 사용 위해. 보기 편하게 bool 대신 0, 1 사용
    cups[i] = 1
    score = 0

    for a, b, c in moves:
        cups[a], cups[b] = cups[b], cups[a] # swap!

        if cups[c]: # 0 or 1
            score += 1

    max_score = max(max_score, score)

print(max_score)
