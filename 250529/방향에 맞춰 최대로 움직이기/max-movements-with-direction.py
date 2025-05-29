n = int(input())
num = [list(map(int, input().split())) for _ in range(n)]
move_dir = [list(map(int, input().split())) for _ in range(n)]
r, c = map(int, input().split())


max_move_num = 0
# 가리키는 방향의 수 중 본인보다 큰 것 추리기 + 전부 시도
# move_num: r, c 위치에 오기까지 움직인 횟수
def try_all_candidates(r, c, move_num):
    global max_move_num
    # 추리기
    biggers = figure_out_biggers(r, c)
    
    if len(biggers) == 0: # 존재 X -> 이동 불가
        max_move_num = max(max_move_num, move_num)
        return
    for br, bc in biggers:
        try_all_candidates(br, bc, move_num + 1)
        # 다음 후보 진행

# 가리키는 방향의 수 중 본인보다 큰 것을 반환
def figure_out_biggers(r, c):
    d = move_dir[r][c]
    answer = []
    dr, dc = convert_to_dr_dc(d)
    candidate_r, candidate_c = r + dr, c + dc
    while 0 <= candidate_r < n and 0 <= candidate_c < n:
        if num[candidate_r][candidate_c] > num[r][c]:
            answer.append((candidate_r, candidate_c))
        candidate_r += dr
        candidate_c += dc
    return answer
    
def convert_to_dr_dc(direction):
    directions = [
        (0, 0), # 무의미
        (-1, 0),
        (-1, 1),
        (0, 1),
        (1, 1),
        (1, 0),
        (1, -1),
        (0, -1),
        (-1, -1)

    ]

    return directions[direction]

    

try_all_candidates(r-1, c-1, 0)
print(max_move_num)
    


