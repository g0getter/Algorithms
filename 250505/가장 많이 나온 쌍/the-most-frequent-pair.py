n, m = map(int, input().split())
pairs = [tuple(map(int, input().split())) for _ in range(m)]

# Solution1. dictionary 사용 -> 입력 외에 다른 유사 이차원 배열(dictionary) 사용
# 1. 돌면서 a, b를 sorted()한 것을 dictionary에 넣음
# 2. dictionary 돌며 가장 큰 value를 반환
# pair_dict = {}
# for a, b in pairs:
#     sorted_tuple = tuple(sorted([a,b]))
#     if sorted_tuple in pair_dict:
#         pair_dict[sorted_tuple] += 1
#     else:
#         pair_dict[sorted_tuple] = 1
        
# print(max(pair_dict.values()))

# Solution2. 유사 이차원 배열 사용x
# 반대로, 가능한 모든 조합의 등장 횟수를 확인. -> O(N*N)? or 다름?

def count_number(i, j):
    count = 0
    for a, b in pairs:
        if (a, b) in [(i, j), (j, i)]:
            count += 1
    
    return count

max_count = 0
for i in range(n+1):
    for j in range(i+1, n+1):
        # Pair 돌며 i, j 등장하는 횟수 세기
        max_count = max(max_count, count_number(i, j))

print(max_count)



