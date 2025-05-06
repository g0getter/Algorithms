n, k = map(int, input().split())
arr = [int(input()) for _ in range(n)]

## Solution1: arr 순회하며 최솟값 지정
# Time O(n^2) (=O(1000 * 1000))
# 지금은 더 빠르나, arr길이(=n) 길어질 경우 더 느린 풀이
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
            break # sorted라 뒤는 볼 이유 없음 -> X. 작은 수가 나올 수도 있음
            # -> 큰 경우로 한정
    # print(min_num, "->", count)
    max_count = max(max_count, count)

print(max_count)

## Solution2(해설): 1~K 순회하며 최솟값 지정
# O(K*N) (=O(10000 * 1000)) 
# - 최악의 경우는 별로지만, K가 작아지고 N이 커질 경우 1보다 더 빠른 풀이.

max_count = 0
for min_num in range(1, k+1):
    # min_num ~ min_num + k 구간 내 원소 개수 세기
    count = 0
    for num in arr:
        if min_num <= num <= min_num + k:
            count += 1

    max_count = max(max_count, count)

print(max_count)

