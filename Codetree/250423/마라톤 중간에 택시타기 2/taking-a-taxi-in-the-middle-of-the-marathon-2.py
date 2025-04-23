import sys
n = int(input())
points = [tuple(map(int, input().split())) for _ in range(n)]
# x = [p[0] for p in points]
# y = [p[1] for p in points]


def get_min_distance():
    min_distance = sys.maxsize
    
    # 제외할 것 선택
    for i in range(1, len(points)-1): # i번째를 제외
        current_distance = 0
        
        new_points = points[:i] + points[i+1:]
        x = [p[0] for p in new_points]
        y = [p[1] for p in new_points]

        # 거리 계산
        for j in range(len(new_points)-1):
            current_distance += abs(x[j]-x[j+1]) + abs(y[j]-y[j+1])

        min_distance = min(current_distance, min_distance)

    return min_distance
    
print(get_min_distance())