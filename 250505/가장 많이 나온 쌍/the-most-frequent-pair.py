n, m = map(int, input().split())
pairs = [tuple(map(int, input().split())) for _ in range(m)]

# 1. 돌면서 a, b를 sorted()한 것을 dictionary에 넣음
# 2. dictionary 돌며 가장 큰 value를 반환
pair_dict = {}
for a, b in pairs:
    sorted_tuple = tuple(sorted([a,b]))
    if sorted_tuple in pair_dict:
        pair_dict[sorted_tuple] += 1
    else:
        pair_dict[sorted_tuple] = 1
        
print(max(pair_dict.values()))


