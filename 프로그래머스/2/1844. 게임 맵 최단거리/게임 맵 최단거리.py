from collections import deque

# 뽑고(dequeue) visited 처리하고 주변 네 칸 valid면 넣고(enqueue)
def solution(maps):
    # queue: roads to visit
    queue = deque()
    
    queue.append((0,0, 1)) # enqueue. (x,y,distance). distance: (x,y)까지의 거리
    
    # 여러 길(경우의 수)별로 이동 거리를 분리해야 함 -> queue에 포함
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
                # visited 처리 - 중복 방지 위해 pop 할 때 말고 방문할 곳 넣을 때 미리 visited 처리
                maps[new_x][new_y] = 2 
        
    return -1
