m1, d1, m2, d2 = map(int, input().split())
A = input()

# Please write your code here.
def get_days(m, d):
    days = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    count = 0

    # m-1월까지의 days
    for month in range(m):
        count += days[month]

    # m월의 days
    count += d

    return count

# 요일 -> 숫자로 변경(월: 0)
def day_to_num(day):
    day = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    for i, d in enumerate(day):
        if A == d:
            return i

# 1. 흐른 날짜 days 계산
# 2. A요일이 days % 7 이하이면 몫(days/7)+1 반환
#                   아니면 몫 반환
diff = get_days(m2, d2) - get_days(m1, d1)

day_a = day_to_num(A)

if day_a <= diff % 7:
    print(diff//7+1)
else:
    print(diff//7)
