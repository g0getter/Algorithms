m1, d1, m2, d2 = map(int, input().split())

# Please write your code here.
if m1 == m2:
    print(d2-d1+1)
else: # 월이 다를 경우

    days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    days_remaining = days[m1]-d1 + 1

    count = days_remaining # m1의 days

    for month in range(m1+1, m2):
        count += days[month] # m1과 m2 사이의 days

    count += d2 # m2의 days

    print(count)