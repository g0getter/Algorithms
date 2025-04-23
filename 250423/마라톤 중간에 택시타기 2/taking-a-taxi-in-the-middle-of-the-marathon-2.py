import sys
n = int(input())
points = [tuple(map(int, input().split())) for _ in range(n)]
x = [p[0] for p in points]
y = [p[1] for p in points]


def get_min_distance():
    min_distance = sys.maxsize
    
    # 제외할 것 선택
    for i in range(1,len(points)-1): # i번째를 제외
        current_distance = 0
        # new_indices = list(range(i)) + list(range(i+1,len(points)))
        
        # 거리 계산
        for j in range(len(new_indices)-1):
            index1 = new_indices[j]
            index2 = new_indices[j+1]
            current_distance += abs(x[index1]-x[index2])+abs(y[index1]-y[index2])
        
        min_distance = min(current_distance, min_distance)

    return min_distance
    
print(get_min_distance())


# def get_new_indices():
#     total_new_indices = []
#     for i in range(1,len(points)-1): # i번째를 제외
#         new_indices = list(range(i)) + list(range(i+1,len(points)))
#         total_new_indices.append(new_indices)

#     return total_new_indices
    
# # 거리 계산
# def calculate_distance(indices):
#     current_distance = 0
#     for j in indices[:-1]:
#         current_distance += abs(x[j]-x[j+1])+abs(y[j]-y[j+1])
    
#     min_distance = min(current_distance, min_distance)


# print(min_distance)