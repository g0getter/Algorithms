n = int(input())
A = list(map(int, input().split()))

# Please write your code here.
def get_distance(k, house):
    sum = 0
    for i, house in enumerate(A):
        sum += house * abs(i - k)
    
    return sum

min_distance = 100*100 # TODO: 최댓값 지정
for i, house in enumerate(A):
    distance = get_distance(i, house)
    min_distance = min(min_distance, distance)

print(min_distance)

