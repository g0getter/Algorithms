a, b, c = map(int, input().split())

# 1. 예외 처리
# 2. 각 분 구한 후 뺄셈

# 11월 한정(11월부터 흐른 분 구하기)
def getMinutesOnNovember(day, hour, minute):
    return (day-1) * 24 * 60 +  hour * 60 + minute

if a == 11 and b <= 11 and c < 11:
    print(-1)
print(getMinutesOnNovember(a, b, c) - getMinutesOnNovember(11, 11, 11))

# [X] 필요 이상으로 로직이 들어간 함수 
# def getMinutes(month, day, hour, minute):
    # count = 0

    # days = [0, 31, 30, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    # # month
    # for m in month: