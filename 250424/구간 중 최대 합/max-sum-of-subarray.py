n, k = map(int, input().split())
arr = list(map(int, input().split()))

max_sum = 0
for i in range(n-k+1):
    curr_sum = 0
    for j in range(k):
        curr_sum += arr[i+j]

    max_sum = max(curr_sum, max_sum)

print(max_sum)