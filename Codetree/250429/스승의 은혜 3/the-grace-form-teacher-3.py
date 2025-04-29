N, B = map(int, input().split())
gifts = [tuple(map(int, input().split())) for _ in range(N)]
P = [gift[0] for gift in gifts]
S = [gift[1] for gift in gifts]

# 1. 50% 학생 pick
# 2. 나머지에 대해,
    # 1. 다 포함 가능? O: return 학생수
    #               X: max(선물+배송비) 제외, 다 포함 가능? ...(반복)

# => ~~ 포함했을 때 가능한지 판단하는 함수 필요(인자: 50% 학생, 100% 학생들)

def is_available(student50_i, student100_i_list):
    student100_i_list = list(student100_i_list)
    # print("50:", student50_i, "100s:", student100_i_list)
    cost = P[student50_i]/2 + S[student50_i]
    for i in student100_i_list:
        cost += P[i] + S[i]
    return B >= cost

def get_student_i_with_most_expensive_price(student100_i_list):
    most_expensive_cost = 0
    most_expensive_i = -1
    for index in student100_i_list:
        cost = P[index]+S[index]
        if most_expensive_cost < cost:
            most_expensive_i = index
            most_expensive_cost = cost
    return most_expensive_i

# 안되면 max 제외해가면서 student_count 확인, 만족하는 명수 반환
def get_max_student_count(student50_i, student100_i_list):
    if is_available(student50_i, student100_i_list):
        return len(student100_i_list) + 1# len(student50_i)
    elif len(student100_i_list) == 0: # 50짜리만 넣어도 비용 충당 불가하다면
        return 0
    else:
        # student_count -= 1
        student_i_to_exclude = get_student_i_with_most_expensive_price(student100_i_list)
        # student100_i_list = student100_i_list.remove(student_i_to_exclude)
        student100_i_list.remove(student_i_to_exclude)
        return get_max_student_count(student50_i, student100_i_list)

def solution():
    max_count = 0
    for student50_i in range(N): # 0~N-1
        student_count = N
        all_i = list(range(N))
        student100_i_list = all_i[:student50_i] + all_i[student50_i+1:]
        # print("student50_i:", student50_i, "student100_i_list:", student100_i_list)
        max_count = max(max_count, get_max_student_count(student50_i, student100_i_list))
    return max_count

print(solution())
