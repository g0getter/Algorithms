MAX_NUM = 10000
n, k = map(int, input().split())
# score_offset[i]: i 위치에 놓인 알파벳의 점수 (0 or 1(G) or 2(H)). 0 위치는 0
score_offset = [0 for _ in range(MAX_NUM+1)]

# 1. 입력 받을 때 score_offset을 같이 초기화&값 세팅 (이때 G->1, H->2, 나머지->0으로 바로 점수로 치환)
# 2. k크기 틀을 i=1부터 i=10000-k까지 돌림  (e.g. 1부터 2까지)
# 3. 돌리면서 내부 점수 계산, 최댓값 매번 업데이트

def calc_score(start_index):
    score = 0
    for i in range(start_index, start_index+k+1):
        score += score_offset[i]

    return score
    
# 1
for _ in range(n):
    # !!: 저장할 때부터 score_offset을 같이 초기화&값 세팅하면 따로 처리하지 않아도 됨
    pos, char = input().split()
    score_offset[int(pos)] = 1 if char == "G" else 2

# 2,3
max_score = 0
for start_i in range(1, 10000-k+1):
    max_score = max(max_score, calc_score(start_i))

print(max_score)