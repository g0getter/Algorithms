from collections import deque
# 뽑고(dequeue) visited 처리하고 주변 네 칸 valid면 넣고(enqueue)
def solution(maps):
    # queue: roads to visit
    queue = deque()
    
    queue.append((0,0, 1)) # enqueue. (x,y,distance). distance: (x,y)까지의 거리
    
    # 여러 길(경우의 수)을 쪼개야 함(지금은 answer이 합쳐져서 들어감) -> queue에 포함
    while queue:
        current_x, current_y, current_distance = queue.popleft() # dequeue(여기로 이동)
        # maps[current_x][current_y] = 2 # visited 처리
        
        if (current_x, current_y) == (len(maps)-1, len(maps[0])-1):
            return current_distance
        
        # 주변 네 칸 valid면 distance+1하고 enqueue
        for (x, y) in [(-1,0), (1,0), (0,-1), (0,1)]:
            new_x = current_x + x
            new_y = current_y + y
            if 0 <= new_x < len(maps) and 0 <= new_y < len(maps[0]) and maps[new_x][new_y] == 1:
                queue.append((new_x, new_y, current_distance + 1))
                maps[new_x][new_y] = 2 # visited 처리
                # print(queue)
        
    return -1


# # 양 4칸 중 valid index이고 길인 곳 모아서, 거기까지의 거리(distance+1)와 함께 반환
# def get_valid_four_roads(position, distance, maps):
#     dx = [-1, 1, 0, 0]
#     dy = [0, 0, -1, 1]
    
#     valid_roads = deque()
    
#     for i in range(len(dx)):
#         x, y = position
#         new_x = x + dx[i]
#         new_y = y + dy[i]
#         if 0 <= new_x < len(maps) and 0 <= new_y < len(maps[0]) and maps[new_x][new_y] == 1:
#             valid_roads.append((new_x, new_y, distance + 1))
            
    return valid_roads
