m1, d1, m2, d2 = map(int, input().split())

# Please write your code here.
days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

days_remaining = days[m1]-d1 + 1

count = days_remaining

for month in range(m1+1, m2):
    count += days[month]

count += d2

print(count)