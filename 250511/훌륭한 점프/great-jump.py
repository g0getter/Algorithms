n, k = map(int, input().split())
arr = list(map(int, input().split()))


# max_num이 가능한지 검증
def is_max_possible(max_num):
    available_indices = []
    for i, num in enumerate(arr):
        if num <= max_num:
            available_indices.append(i)

    # available_indices가 가능한지 검증
    length = len(available_indices)
    # 맨 앞, 맨 뒤 포함 x 시 return False
    if 0 not in available_indices or length-1 not in available_indices:
        return False

    for i in range(len(available_indices)-1): #길이 2면 i는 0까지 들어가야 함
        if available_indices[i+1] - available_indices[i] > k:
            return False
    return True

def solution():
    for max_num in range(2, n+1): # TODO: 더 좋은 방법 확인!

        # available_indices가 가능한지 검증
        if is_max_possible(max_num):
            return max_num


print(solution())