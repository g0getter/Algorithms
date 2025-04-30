import sys

INT_MAX = sys.maxsize

n = int(input())
arr = list(map(int, input().split()))

# 제거된 원소의 위치를 removed_idx라 가정헀을 때,
# 인접한 원소간의 차의 합을 계산해 반환하는 함수
def score(removed_idx):
    # arr을 따로 주지 않음 -> 전역 arr을 사용 -> arr이 훼손되면 안됨 
    # -> 수정 없이, 새 변수 생성도 없이(인자로 주지 않으므로) 해야함 -> index로만 거름
    # '단, arr 2배인 상태는 포함되어 있을 것이므로 나중에(이 함수 밖에서 별개로) 원복 필요하겠다'

    # 인접해야하는데 i+1, i를 냅다 쓸 순 없음(removed_idx 걸러야 하므로)
    # -> 다음 것 매번 removed_idx와 같은지 확인하는 것도 별로..
    # ----> 이전 변수를 prev로 두고 비교해보기
    distance_sum = 0

    prev_idx = 0 if removed_idx != 0 else 1
    for i in range(1, n):
        if i != removed_idx:
            distance_sum += abs(arr[i]-arr[prev_idx])
            prev_idx = i
    
    return distance_sum

# 2배를 할 숫자의 위치 i를 결정하고,
# 그 다음 제거할 숫자의 위치 j를 결정하여
# 남은 숫자들의 인접한 차의 합 중
# 최솟값을 찾습니다.
min_distance_sum = INT_MAX
for i in range(n): # 2배
    arr[i] *= 2

    for j in range(n): # 제거
        distance_sum = score(j)
        min_distance_sum = min(min_distance_sum, distance_sum)

    # 이번 차례 다 구했으니까 2배한 것 원복
    arr[i] //= 2
print(min_distance_sum)
