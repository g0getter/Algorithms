m1, d1, m2, d2 = map(int, input().split())

# 시작
def get_days(m, d):
    days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    count = 0
    # m-1월까지의 days
    for month in range(m):
        count += days[month]
    
    # m월의 days
    count += d

    return count

# 흐른 날짜 계산해서 + 월요일(0으로 지정) 후 % 7
day = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

# 흐른 날짜 (음수도 나올 수 있음)
diff = get_days(m2, d2) - get_days(m1, d1)
print(day[diff % 7])

# cf. 만약 음수 % 7이 여전히 음수라면, diff < 0이면 +7 해서 %7하면 됨


