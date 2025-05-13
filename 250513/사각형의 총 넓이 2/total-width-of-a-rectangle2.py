n = int(input())
# 개선1. 튜플로 한 번에 받고 싶다면
rects = [
    tuple(map(int, input().split()))
    for _ in range(n)
]

# Solution1. 기록 위해 Set 이용
# 1. 2차원 배열 생성 (max x, max y)
# 2. true로 변경 (x1,y1)~(x2-1, y2-1)
# 3. true인 것 세어서 반환 (min x, min y) ~ (max x, max y)

# 이차원 배열 만들 필요 없이, SET 사용하면 간단하고 빠름. (길이도 한 번에 구해짐!)
# coords_set = set()

# # 직사각형 하나당
# for x1, y1, x2, y2 in rects: 
#     # 2
#     for x in range(x1, x2): # 개선2. 문제에서 x1 < x2라 함
#         for y in range(y1, y2): # 문제에서 y1 < y2라 함
#             coords_set.add((x,y))

# # 3
# print(len(coords_set))

# Solution2. 기록 위해 이차원 배열 이용 (해설)
# 1. 전부 양수로 만들기 위해 전부 100 더함
# 2. 200(=100+100) * 200 짜리 공간 만들어서 좌표 색칠(true)
# 3. 색칠된(true) 부분 개수 세기
## 주의: (0,0)부터 (1,1) -> 넓이 1임. (x2-1, y2-1)까지만 칠해야 함

MAX_R = 200 # 이차원 배열 크기
OFFSET = 100 # 양수로 만들기 위해 더할 offset

arr = [
   [False] * MAX_R
   for _ in range(MAX_R) 
]

# 1
for x1, y1, x2, y2 in rects:
    # 2. 색칠
    x1 += OFFSET
    y1 += OFFSET
    x2 += OFFSET
    y2 += OFFSET

    for x in range(x1, x2):
        for y in range(y1, y2):
            arr[x][y] = True

# 3 개수 세기
area = 0
for x in range(MAX_R):
    for y in range(MAX_R):
        if arr[x][y]:
            area += 1
    
print(area)
