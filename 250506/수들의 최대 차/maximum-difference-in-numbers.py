n, k = map(int, input().split())
arr = [int(input()) for _ in range(n)]

# 1. 최솟값 지정
# 2. 최소~최소+K값까지 중 해당하는 수의 개수(=뽑는 수) 도출
# 3. 개수 도출 후 매번 max 업데이트
sorted_arr = sorted(arr)
max_count = 0
for min_num in sorted_arr:
    count = 0
    for num in sorted_arr:
        if min_num <= num <= min_num + k:
            count += 1
        elif num > min_num + k:
            break # sorted라 뒤는 볼 이유 없음 -> X(왜냐면 작은 수가 나올 수도 있음)
    # print(min_num, "->", count)
    max_count = max(max_count, count)

print(max_count)

