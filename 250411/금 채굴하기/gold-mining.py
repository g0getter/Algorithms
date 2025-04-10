n, m = map(int, input().split())
grid = [list(map(int, input().split())) for _ in range(n)]

# Please write your code here.
# x, y 기준 k번 이내로 갈 수 있는 유효한(!) 영역들
def test(x, y, k):
    # result 구하기(이번 판)
    abs_list = []
    abs_set = set()
    for i in range(k+1):
        abs_list.append((i, k-i))
    
    # 부호 붙이기
    for x, y in abs_list:
        abs_set.append(x*1,y*1)
        abs_set.append(x*1,y*1)
    print(abs_set)
test(1,1,2)
    
# def get_grid_in_k(x, y, k):
#     # k 작은 것들 다 포함함!!
#     if k == 0:
#         return [(x,y)]
#     # result 구하기(이번 판)
#     abs_list = []
#     for i in range(k):
#         abs_list.append((i, k-i))
#     print(abs_list)
#     return get_grid_in_k(x, y, k-1) + result
    

# # x, y 기준이고 범위 k일 때 내부의 금 개수
# def count_gold(x, y, k): # x, y: 기준(0,0 ~ n-1,n-1)
# # e.g. (1, 1, 1)
#     num = 0
#     positions = get_grid_in_k(k)
#     for i, j in positions:
#         if grid[i][j] == 1:
#             num += 1
#     return num

# def calculate_cost(k):
#     return pow(k, 2) + pow(k + 1, 2)

# max_gold_count = 0

# for k in range(n): # 0 ~ n-1
#     for i in range(n):
#         for j in range(n):
#             result = count_gold(i, j, k) * m - calculate_cost(k)
#             if result >= 0:
#                 max_gold_count = max(max_gold_count, result)

# print(max_gold_count)