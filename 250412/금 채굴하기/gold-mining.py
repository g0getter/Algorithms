# import time 
n, m = map(int, input().split())
grid = [list(map(int, input().split())) for _ in range(n)]

# x, y 기준 정확히 k번으로 갈 수 있는 유효한(!) 영역들
def get_relative_grid_current_k(x, y, k):
    # result 구하기(이번 판)
    abs_list = []
    abs_set = set()
    for i in range(k+1):
        abs_list.append((i, k-i))
    
    # 부호 붙이기
    for x, y in abs_list:
        # abs_set.add((x*1, y*1))
        # abs_set.add((x*1, y* -1))
        # abs_set.add((x* -1, y*1))
        # abs_set.add((x* -1, y* -1))
        abs_set.update({
            (x, y),
            (-x, y),
            (x, -y),
            (-x, -y),
        })

    return list(abs_set)

# x, y 기준 k번 이내로 갈 수 있는 유효한 영역들
def get_relative_grid_in_k(x, y, k):
    # k 작은 것들 다 포함함!!
    abs_list = []
    for i in range(0,k+1):
        abs_list += get_relative_grid_current_k(x, y, i)
    
    return abs_list
    

# x, y 기준이고 범위 k일 때 내부의 금 개수
def count_gold(x, y, k): # x, y: 기준(0,0 ~ n-1,n-1)
# e.g. (1, 1, 1)
    num = 0
    positions = get_relative_grid_in_k(x, y, k)
    
    for dx, dy in positions:
        if 0 <= x + dx < n and 0 <= y + dy < n:
            if grid[x+dx][y+dy] == 1:
                num += 1
    return num

def calculate_cost(k):
    return pow(k, 2) + pow(k + 1, 2)

max_gold_count = 0

for k in range(2*n): # 0 ~ n-1 말고 2n까지(?!)
    for i in range(n):
        for j in range(n):
            gold_count = count_gold(i, j, k)
            if gold_count * m - calculate_cost(k) >= 0:
                max_gold_count = max(max_gold_count, gold_count)

print(max_gold_count)
# # 시간 측정 시작
# start_time = time.time()

# # 여기서부터 코드를 실행
# max_gold_count = 0

# for k in range(2*n): 
#     for i in range(n):
#         for j in range(n):
#             gold_count = count_gold(i, j, k)
#             if gold_count * m - calculate_cost(k) >= 0:
#                 max_gold_count = max(max_gold_count, gold_count)

# # 시간 측정 끝
# end_time = time.time()

# # 실행 시간 출력
# print(f"Execution time: {end_time - start_time} seconds")