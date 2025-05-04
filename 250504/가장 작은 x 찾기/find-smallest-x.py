n = int(input())
ranges = [tuple(map(int, input().split())) for _ in range(n)]

MAX_NUM = 10000

# 1. 1부터 시작
# 2. 조건 전부 만족 확인
#    0번째 조건 확인 -> o -> 계속
#                    x -> 2부터 다시 시작
# ...

# number이 문제의 조건(N개 판단)을 만족하는지 반환
def is_answer(number):
    for a, b in ranges:
        number *= 2
        if a <= number <= b:
            continue
        else:
            return False ##

    return True ##

# num 증가 담당
for num in range(1, MAX_NUM+1):
    if is_answer(num):
        print(num)
        break

# 분기 로직이 애매하고 생각할 게 많아서 복잡해지면 함수로 분리해보기.