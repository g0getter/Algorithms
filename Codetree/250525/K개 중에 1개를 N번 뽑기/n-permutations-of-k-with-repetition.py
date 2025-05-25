K, N = map(int, input().split())

answer = []

# 지금까지 뽑아둔 것 출력
def print_answer():
    str_answer = ""
    for num in answer:
        str_answer += str(num) + " "
    print(str_answer)

# `num`번째 수 뽑기 (num=1부터 시작)
def choose(num):
    if num == N+1:
        print_answer()
        return

    for i in range(1, K+1):
        answer.append(i)
        choose(num+1)
        # 다 했으면 -> 다시 answer.append(2)부터. -> 반복문
        answer.pop() # 필수! 빼먹지 않기


choose(1)