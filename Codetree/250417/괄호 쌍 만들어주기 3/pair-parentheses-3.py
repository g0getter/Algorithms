A = input()

# Please write your code here.
# 1. 여는 괄호 찾음 - 바깥 for
# 2. 그 뒤를 돌며 닫는 괄호 찾음 - 내부 for
#    1) 찾으면 count +1
# 다 돌고 print(count)
count = 0

for i, paren in enumerate(A):
    if paren == "(":
        for j in range(i+1, len(A)):
            if A[j] == ")":
                count += 1

print(count)