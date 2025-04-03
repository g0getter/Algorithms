m1, d1, m2, d2 = map(int, input().split())

# 시작
def get_days(m, d):
    days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    count = 0
    for month in range(m):
        count += days[month]
    
    count += d

    return count

# 흐른 날짜 계산해서 + 월요일(0으로 지정) 후 % 7
day = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]


# 흐른 날짜 (음수도 나올 수 있음)
diff = get_days(m2, d2) - get_days(m1, d1)
print(day[diff % 7])


