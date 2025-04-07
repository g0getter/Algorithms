n = int(input())

# Please write your code here.
# Brute-force
# 1. 모든 가능한 자릿수 생성
# 2. 각각이 아름다운 수인지 판별
# [아름다운 수 판별법]
# 각 자리를 돌면서, 그 자리 숫자 k에 대해
# 1. stack 확인
# 2. if 비었 -> stack에 k를 k개 추가
# 3. stack.popLast(), k와 같은지 확인
#    1) k와 같 -> 계속함
#    2) k와 안 같 -> return false

# 1. 모든 가능한 자릿수 생성
nums = []

# for i in range(1,5): -> n번 중첩
number = ""
# for i in range(1, 5):
#     # 맨 앞이 i일 때 나올 수 있는 아이들
#     children = get_children(start=f"{i}", length=n)
#     for child in children:
#         nums.append(f"{i}{child}")
    
# def get_children(starts, length):
#     if length - len(start) == 1:
#         return ~~
    
#     answer = []
#     for child in range(1,5):
#         answer.append(get_children(f"{start}{child}", length))

# 앞이 ~일 때 1~4 하나씩 붙이는 함수
def append_a_number(prefix):
    if len(prefix) == n:
        return prefix
    append_a_number([f"{prefix}{i}" for i in range(1,5)])

print(append_a_number(""))