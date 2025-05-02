n = int(input())
seats = input()

# 1. 전체 i 탐색(For), 그 내부에서
# 2. 1이면 continue
# 3. i 자리에 넣고, 최소 거리 계산()
# 4. 그 거리를 max 변수로 매번 업데이트

# 좌석 간 가장 가까운 거리 반환
# 1 넣고
# prev변수 생성
# 전체 돌면서 1 나오면, 
# prev가 None이 아니면 차 계산, prev에 넣기
# Start가 None이면 prev에 넣기
def get_min_distance(new_seat_i):
    min_distance = n

    new_seats = seats[:new_seat_i] + "1" + seats[new_seat_i+1:]
    
    prev = None

    for i, seat in enumerate(new_seats): # 0, 1, ..., n-2
        if seat == "0": continue # 문자열!!
        
        if prev != None: # prev는 Int이므로 그냥 넣으면 안됨. 정확히 != None을 명시
            min_distance = min(min_distance, i - prev)
        prev = i # prev 업데이트
        
    return min_distance

max_distance = 0
for i, seat in enumerate(seats):
    if seat == "1": # 문자열!!
        continue

    max_distance = max(max_distance, get_min_distance(i))

print(max_distance)
    
