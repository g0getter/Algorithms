n = int(input())
arr = list(map(int, input().split()))

# 작을수록 여러 번 덧셈하는 것이 이득 -> 매번 가장 작은 수끼리 합치기
# 가장 작은 두 수 -> 매번 sort(O(N)) 후 앞 2개?
# N = 10^5이므로 O(k*N)이더라도 10^8 아래(=1초)이므로 ㄱㅊ

cost = 0
while(len(arr) > 1):
    arr.sort(reverse=True) # O(N)
    sub_sum = arr.pop() + arr.pop()
    cost += sub_sum
    arr.append(sub_sum)

print(cost)