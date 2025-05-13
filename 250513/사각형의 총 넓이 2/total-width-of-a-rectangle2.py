n = int(input())
x1, y1, x2, y2 = [], [], [], []
for _ in range(n):
    a, b, c, d = map(int, input().split())
    x1.append(a)
    y1.append(b)
    x2.append(c)
    y2.append(d)

# 1. 2차원 배열 생성 (max x, max y)
# 2. true로 변경 (x1,y1)~(x2-1, y2-1)
# 3. true인 것 세어서 반환 (min x, min y) ~ (max x, max y)

# arr = [ ([False] * (max(x1+x2)+1)) for _ in range(max(y1+y2)+1) ] # 1
coords_set = set()
# FIXME: +1은 왜?

# 직사각형 하나당
for xa, ya, xb, yb in zip(x1, y1, x2, y2):
    # 2
    for x in range(min(xa, xb), max(xa, xb)):
        for y in range(min(ya, yb), max(ya, yb)):
            # arr[x][y] = True
            coords_set.add((x,y))

# 3
# count = 0
# for i in range(len(arr)):
#     for j in range(len(arr[0])):
#         count += 1 if arr[i][j] else 0
print(len(coords_set))

# for i in range(len(arr)):
#     print(arr[i])

# print(count)