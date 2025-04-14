# 입력 받기
n, m = map(int, input().split())
board = [input() for _ in range(n)]

def get_max_area():
    # 정사각형의 최대 변의 길이
    max_length = min(n, m)

    current_length = max_length
    while current_length > 1:
        # print("current_length", current_length)
        for i in range(n-current_length+1):
            for j in range(m-current_length+1):
                # print(i, j) #good! 잘 나옴
                if board[i][j] == board[i][j+current_length-1] == board[i+current_length-1][j] == board[i+current_length-1][j+current_length-1]:
                    # print(i, j)
                    return current_length * current_length
        current_length -= 1

    return 1

print(get_max_area())