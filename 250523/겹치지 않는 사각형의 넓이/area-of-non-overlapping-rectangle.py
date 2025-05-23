x1 = [0] * 3
y1 = [0] * 3
x2 = [0] * 3
y2 = [0] * 3

x1[0], y1[0], x2[0], y2[0] = map(int, input().split())
x1[1], y1[1], x2[1], y2[1] = map(int, input().split())
x1[2], y1[2], x2[2], y2[2] = map(int, input().split())

# TODO(확인): 공간 얼마로 만들지. 2000*2000?
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

OFFSET = 1000

#1. 좌표 재조정
for i, x in enumerate(x1):
    x1[i] = x + 1000

for i, x in enumerate(x2):
    x2[i] = x + 1000
    
for i, y in enumerate(y1):
    y1[i] = y + 1000

for i, y in enumerate(y2):
    y2[i] = y + 1000

# print(x1, x2, y1, y2)

coordinate = [ [0] * 2000 for _ in range(2000) ]
# 2. 1로 채우기
for i in range(0, 2):

    for j in range(x1[i], x2[i]):
        for k in range(y1[i], y2[i]):
            coordinate[k][j] = 1 # TODO: 순서 확인

# 3. 0으로 비우기
    for j in range(x1[2], x2[2]):
        for k in range(y1[2], y2[2]):
            coordinate[k][j] = 0

print(count_one(coordinate))
    