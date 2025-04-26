import sys

n = int(input())
points = [tuple(map(int, input().split())) for _ in range(n)]
x = [p[0] for p in points]
y = [p[1] for p in points]

# 1. 2개 pick
# 2. 거리의 제곱 구하기
# 3. 거리의 제곱 중 min 구해서 print
min_distance = sys.maxsize

for i in range(n):
    for j in range(i+1,n):
        x1, y1 = points[i]
        x2, y2 = points[j]
        distance = (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2)
        min_distance = min(distance, min_distance)
    
print(min_distance)
