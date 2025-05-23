# x1 = [0] * 3
# y1 = [0] * 3
# x2 = [0] * 3
# y2 = [0] * 3

# x1[0], y1[0], x2[0], y2[0] = map(int, input().split())
# x1[1], y1[1], x2[1], y2[1] = map(int, input().split())
# x1[2], y1[2], x2[2], y2[2] = map(int, input().split())

# tuple 형태의 배열로 받기
n = 3
rects = [
    tuple(map(int, input().split())) # 위의 것 대신!!
    for _ in range(n)
]

# ❗️ 공간 얼마로 만들지? 2000*2000
# 1. 좌표 +1000해서 재조정
# 2. 1로 채우기
# 3. M은 다시 0으로 비우기
# 4. 1인 개수 세기

def count_one(arr):
    area = 0
    for i in range(len(arr[0])):
        for j in range(len(arr)):
            if arr[i][j]: # TODO: i, j 순서
                area += 1
    
    return area

def print_coordinate(arr):
    for i in arr:
        print(i)

OFFSET = 10
MAX_R = OFFSET * 2
coordinate = [ [0] * (MAX_R+1) for _ in range(MAX_R+1) ]

for i, (x1, y1, x2, y2) in enumerate(rects):
    # 1. 좌표 재조정
    x1, y1 = x1 + OFFSET, y1 + OFFSET
    x2, y2 = x2 + OFFSET, y2 + OFFSET

    content = 1 if (i == 0 or i == 1) else 0

    # 2. 1로 채우기 & 3. 0으로 비우기 (순서/위치 따라)
    for x in range(x1, x2):
        for y in range(y1, y2):
            coordinate[x][y] = content # 1, 2, 3을 차례로 채움
            
# 4. 1인 개수 세기
print(count_one(coordinate))
