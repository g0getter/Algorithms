import heapq

n = int(input())
arr = list(map(int, input().split()))

# 작을수록 여러 번 덧셈하는 것이 이득 -> 매번 가장 작은 수끼리 합치기
# 가장 작은 두 수 -> 매번 sort(O(N)) 후 앞 2개?
# N = 10^5이므로 O(k*N)이더라도 10^8 아래(=1초)이므로 ㄱㅊ

heapq.heapify(arr) # 최소 힙 이용 - O(logN)에 최솟값 뽑을 수 있도록. sort시 O(N)
cost = 0
while(len(arr) > 1):
    # arr.sort(reverse=True) # O(N)
    # sub_sum = arr.pop() + arr.pop()
    sub_sum = heapq.heappop(arr) + heapq.heappop(arr) 
    cost += sub_sum
    # arr.append(sub_sum)
    heapq.heappush(arr, sub_sum) # 합친 값 다시 추가

print(cost)

# Time complexity(heapq): O(N x log N)
# Time complexity(그냥 sort): O(N^2 x log N)