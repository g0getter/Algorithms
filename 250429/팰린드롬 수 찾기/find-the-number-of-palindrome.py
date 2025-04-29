X, Y = map(int, input().split())

# X~Y 범위를 돌며 팰린드롬 개수 세기
# 팰린드롬 판단: 맨 앞, 맨 뒤에서 하나씩 앞으로 오며 같은지 확인
def is_palindrom(num):
    num = str(num)
    n = len(num)
    for i in range(n//2): # i: 0~n//2(미포함)
        if num[i] != num[-(i+1)]:
            return False
    
    return True

count = 0
for num in range(X, Y+1):
    if is_palindrom(num):
        count += 1
print(count)