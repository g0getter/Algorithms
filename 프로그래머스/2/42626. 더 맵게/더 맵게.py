import heapq

def solution(scoville, K):
    
    answer = 0
    heapq.heapify(scoville) # scoville: mutable!!
    
    minValue = scoville[0]
    if minValue >= K:
        return answer
    
    while minValue < K and len(scoville) > 1:
        firstMin = heapq.heappop(scoville)
        secondMin = heapq.heappop(scoville)
        
        heapq.heappush(scoville, firstMin + secondMin * 2)
        
        minValue = scoville[0]
        answer += 1
        
    if len(scoville) == 1 and minValue < K:
        return -1
    
    return answer

# 1. 가장 작은 것끼리 연산
# 2. min이 이상인지 확인, 아니면 min 2개에 대해 다시 연산
# 반복

# 복잡도 줄이기: 연산한 값을 오름차순으로 자리에 맞게 삽입?
