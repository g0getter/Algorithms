n = int(input())
moves = [tuple(map(int, input().split())) for _ in range(n)]# [(1, 2, 1)],...
# a, b, c = zip(*moves)
# a, b, c = list(a), list(b), list(c)

def swap(a, b, cups):
    temp = cups[a]
    cups[a] = cups[b]
    cups[b] = temp
    return cups

max_score = 0
for i in range(1,4):
    cups = [False] * 4 # 1, 2, 3번 종이컵 그대로 사용 위해
    cups[i] = True
    score = 0
    for a, b, c in moves:
        cups = swap(a, b, cups)
        if cups[c] == True:
            score += 1
    max_score = max(max_score, score)

print(max_score)

    