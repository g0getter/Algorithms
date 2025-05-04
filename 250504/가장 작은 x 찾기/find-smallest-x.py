n = int(input())
ranges = [tuple(map(int, input().split())) for _ in range(n)]
a, b = zip(*ranges)
a, b = list(a), list(b)

# 1. 1부터 시작
# 2. 조건 전부 만족 확인
#    0번째 조건 확인 -> o -> 계속
#                    x -> 2부터 다시 시작
# ...

num = 1
answer_found = False
# num 증가
while num <= ranges[0][1]/2:
    num_modifying = num
    # 
    for a, b in ranges:
        num_modifying *= 2
        if a <= num_modifying <= b:
            answer_found = True
            continue
        else:
            num += 1
            answer_found = False
            break
        
    if answer_found:
        print(num)
        break
