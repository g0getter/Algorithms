N, C, G, H = map(int, input().split())
ranges = [tuple(map(int, input().split())) for _ in range(N)]

# 온도별로 장비 돌며 작업량 계산, 중간에 max 업데이트
max_work = 0
for temp in range(1000+1): # or max(Tb)
    work = 0
    for a, b in ranges:
        if temp in range(a):
            work += C
        elif temp in range(a, b+1):
            work += G
        else: # temp > b
            work += H
        
    max_work = max(max_work, work)

print(max_work)