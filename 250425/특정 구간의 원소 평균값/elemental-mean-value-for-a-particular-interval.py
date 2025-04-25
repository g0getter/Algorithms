n = int(input())
arr = list(map(int, input().split()))

count = 0
for start in range(n):
    for end in range(start, n):
        sum = 0
        for i in range(start, end+1):
            sum += arr[i]
        avg = sum / (end - start + 1)
        # 찾기
        for num in arr[start:end+1]:
            if avg == num:
                count += 1
                break
        
print(count)
        