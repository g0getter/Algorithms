n, k = map(int, input().split())
arr = list(map(int, input().split()))

max_sum = 0
for i in range(n-k+1):
    sum = arr[i] + arr[i+1] + arr[i+2]
    max_sum = max(sum, max_sum)

print(max_sum)