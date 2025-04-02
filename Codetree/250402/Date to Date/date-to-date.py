m1, d1, m2, d2 = map(int, input().split())

# 상대적인 값(차) 말고 절대적인 값을 각각 구해서 뺄셈
def num_days(m, d):
    days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    count = 0

    for month in range(m):
        count += days[month]
    
    count += d # m월의 days

    return count

print(num_days(m2, d2) - num_days(m1, d1) + 1)

