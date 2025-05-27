k, n = map(int, input().split())


# 1 이상 K 이하 숫자를 for 문으로 넣 <- 재귀함수로 자기 자신 call
# 근데 앞에 넣으려는 것과 같은 수가 2개 있으면 pass(안 넣고 다음 순서로 넘김)
# 다 되면(만들어진 길이가 n과 같으면) 출력, 아니면 하나 pop해서 비워둠

answer = []

def print_answer():
    str_answer = ""
    for i in answer:
        str_answer += f"{i} "
    
    print(str_answer)

# `num`번째 수 뽑기(num=0부터 시작)
def choose(num):
    if num == n:
        print_answer()
        return
    for i in range(1, k+1):
        # 근데 앞에 넣으려는 것과 같은 수가 2개 있으면 pass(안 넣고 다음 순서로 넘김)
        if len(answer) >= 2 and answer[-1] == answer[-2] == i:
            continue
        answer.append(i)
        choose(num+1)

        answer.pop()

choose(0)
