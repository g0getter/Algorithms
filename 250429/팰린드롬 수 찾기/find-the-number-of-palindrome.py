X, Y = map(int, input().split())

# Please write your code here.
def is_palindrom(num):
    num = str(num)
    n = len(num)
    for i in range(n-1):
        print(i, -i)
        if num[i] != num[-i]:
            return False
    
    return True


print(is_palindrom(123))
