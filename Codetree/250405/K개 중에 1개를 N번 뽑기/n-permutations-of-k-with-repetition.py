K, N = map(int, input().split())

# Please write your code here.
answer = []
def print_answer():
    str_answer = ""
    for num in answer:
        str_answer += str(num) + " "
    print(str_answer)

def choose(num):
    if num == N+1:
        print_answer()
        return

    for i in range(1,K+1):
        answer.append(i)
        choose(num+1)
        # 다 했으면 -> 다시 answer.append(2)부터. -> 반복문
        answer.pop() # 필수! 빼먹지 않기


choose(1)