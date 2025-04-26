import sys

n = int(input())
points = [tuple(map(int, input().split())) for _ in range(n)]
x = [p[0] for p in points]
y = [p[1] for p in points]

min_square_area = sys.maxsize
    
for i in range(len(points)):
    x_excluded = x[:i] + x[i+1:]
    y_excluded = y[:i] + y[i+1:]
    square_area = (max(x_excluded)-min(x_excluded)) * (max(y_excluded)-min(y_excluded))
    min_square_area = min(min_square_area, square_area)

print(min_square_area)