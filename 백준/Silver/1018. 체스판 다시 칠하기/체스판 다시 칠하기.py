# 입력 받기
n, m = map(int, input().split())
board = [input() for _ in range(n)]

# 바꿔야 하는 칸의 개수 반환
def count_recolor_grid(x, y, frame):
    count = 0

    for dx in range(8):
        for dy in range(8):
            if frame[dx][dy] != board[x+dx][y+dy]:
                count += 1
    return count

white_row = "WBWBWBWB"
black_row = "BWBWBWBW"
frame_white_first = [white_row, black_row, white_row, black_row, white_row, black_row, white_row, black_row]
# frame_black_first = [black_row, white_row, black_row, white_row, black_row, white_row, black_row, white_row]

min_count = 8 * 8

# (i, j)가 맨 왼쪽 위
for i in range(n-7): # row: i, i+1, ... , i+7
    for j in range(m-7):
        recolor_count_white_first = count_recolor_grid(i, j, frame_white_first)
        min_count = min(recolor_count_white_first, 8*8 - recolor_count_white_first, min_count)
        # white로 시작할 때 바꿔야 하는 칸의 개수 = 8*8 - black으로 시작할 때 바꿔야 하는 칸의 개수(만들고자 하는 것이 정확히 반대이므로)
print(min_count)
