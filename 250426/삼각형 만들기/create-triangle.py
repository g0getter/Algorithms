n = int(input())
points = [tuple(map(int, input().split())) for _ in range(n)]
x = [p[0] for p in points]
y = [p[1] for p in points]

# 1. 3개 pick
# 2. x 2개 같 & y 2개 같 -> max_area 업데이트
max_area = 0
def are_two_out_of_three_same(list):
    return len(set(list)) == 2

for i in range(n):
    for j in range(i+1, n):
        for k in range(j+1, n):
            x_three = [points[i][0], points[j][0], points[k][0]]
            y_three = [points[i][1], points[j][1], points[k][1]]

            if are_two_out_of_three_same(x_three) and are_two_out_of_three_same(y_three):
                area = (max(x_three)-min(x_three)) * (max(y_three)-min(y_three)) # rect area (=triangle area*2)
                max_area = max(max_area, area)

print(max_area)