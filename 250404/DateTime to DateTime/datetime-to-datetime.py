a, b, c = map(int, input().split())

# 1. (X)예외 처리 - 예외 처리 필요 없음!!!!!!!!! 음수면 -1 하면 됨
# 2. 각 분 구한 후 뺄셈

# 11월 한정(11월 0시 0분부터 흐른 분 구하기)
def getMinutesOnNovember(day, hour, minute):
    return (day-1) * 24 * 60 +  hour * 60 + minute
    # 사실 차를 구할거라 day-1도 안해도 되긴 하나, 11월 0시 0분부터 흐른 분을 구한다는 의미에서 둠

diff = getMinutesOnNovember(a, b, c) - getMinutesOnNovember(11, 11, 11)
print(-1 if diff < 0 else diff)

# (X)필요 이상으로 로직이 들어간 함수
# def getMinutes(month, day, hour, minute):
    # days = [0, 31, 30, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    # # month
    # for m in month:
    # ...