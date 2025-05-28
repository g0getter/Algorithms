n, m, k = map(int, input().split())
nums = list(map(int, input().split()))

# 완전 탐색(모두 해봐야 함) + 1~k 중 n번 숫자를 뽑는 모든 경우의 수 <- k^n.. 이게 맞나
# 5초 = 5*10^8 ?  최대 4^12=2^24=16777216 < 10^8

# 1. 각 턴에 몇 번 말 뽑을지 결정 <- backtracking
# 1-1. for문 돌리되, 재귀로 자기자신 호출하고, 다 하면 하나 pop()

# [2. 각 말 별로 M까지 도달했으면 +1점
# 3. 획득 점수 계산, max 획득 점수 업데이트]
# 4. max 획득 점수 출력

horse_list = [] # [1,2,2,2] -> [1,2,2,3], .. 바뀜
# 1. 각 턴에 몇 번 말 뽑을지 결정 <- backtracking
# 1-1. for문 돌리되, 재귀로 자기자신 호출하고, 다 하면 하나 pop()
# num번째(=0부터 시작) 실행할 말을 결정하는 함수
def decide(num):
    if num == n:
        # 하나의 말 리스트 완성
        calculate_score(horse_list)
        return
    for i in range(1, k+1): # 말 1, .., k
        horse_list.append(i)
        decide(num+1)

        horse_list.pop() # 다음을 진행하기 위해

max_score = 0
# 현재 점수 계산, 최댓값 업데이트
def calculate_score(horses):
    global max_score
    score = 0
    # 현재 점수 계산
    horse_positions = [1] * (k+1) # 0번째는 뺌
    for i, horse in enumerate(horses):
        horse_positions[horse] += nums[i]

    # M에 도달한 말 세기
    for position in horse_positions:
        if position >= m:
            score += 1 
    
    max_score = max(max_score, score)


decide(0)
print(max_score)