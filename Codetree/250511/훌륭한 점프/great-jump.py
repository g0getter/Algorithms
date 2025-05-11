n, k = map(int, input().split())
arr = list(map(int, input().split()))


# 1. 정답이 a일 때라 가정
# 2. 가능한 수의 index를 배열에 넣기
# 3. 배열에서 인접 원소(=인접한 arr의 index) 간의 차이가 k 이하인지 확인
# 4-1. 모두 통과 -> true, 즉시 return. (점점 커지므로 현재가 최솟값)
# 4-2. 하나라도 불만족 -> false
## 1의 range: min(arr)부터 max(arr)까지, 단, (3)에서 배열이 arr의 맨 앞과 맨 뒤를 포함하는지 반드시 확인

# max_num이 가능한지 검증
def is_max_possible(max_num):
    available_indices = []
    for i, num in enumerate(arr):
        if num <= max_num:
            available_indices.append(i)

    # available_indices가 가능한지 검증
    # arr의(!) 맨 앞, 맨 뒤 포함 x 시 return False
    if 0 not in available_indices or n-1 not in available_indices:
        return False

    for i in range(len(available_indices)-1): #길이 2면 i는 0까지 들어가야 함
        if available_indices[i+1] - available_indices[i] > k:
            return False
    return True

def solution():
    for max_num in range(min(arr), max(arr)+1): # TODO: 더 좋은 방법 확인!

        # available_indices가 가능한지 검증
        if is_max_possible(max_num):
            return max_num

print(solution())