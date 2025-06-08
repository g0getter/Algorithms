def solution(people, limit):
    # '순간의 최선의 선택'이 '전체 최선'인가?
    # 순간의 최선의 선택: 한 명이라도 같이 태우는 게 이득 -> 가장 무거운 사람 + 가장 가벼운 사람 함께 태워보기. 가장 무거운 사람을 나중에 태우려면 어쨌든 혼자 타게 될 것이므로, 어떤 무게의 사람이든 함께 태우는 것이 이득. -> 매번 최선의 선택을 하고, 그걸 반복 -> Greedy
    
    # 1. 내림차순 줄세움
    # 2. 맨 앞(무겁) + 맨 뒤 조합이 가능한지 확인, 가능하면 빼고 구명보트 개수 +1
    # 3. 불가하다면 맨 앞 + 맨 뒤 -1 조합이 가능한지 확인.
    # 4. 사람이 아무도 안 남을 때까지 반복, 끝난 후 구명보트 개수 반환
    ## 시간 초과 보완: [1:-1] 슬라이싱 대신 투 포인터 사용 - 시작, 끝
    answer = 0
    people.sort(reverse=True)
    start = 0
    end = len(people)-1
    
    while start < end:
        if people[start] + people[end] <= limit:
            start += 1
            end -= 1
        else: # 첫 번째(가장 무겁)만 보냄
            start += 1
        
        answer += 1
        
    # 홀수명일 경우 start와 end가 같아질 것이므로 마지막 하나만 처리
    if start == end:
        answer += 1
        
    return answer