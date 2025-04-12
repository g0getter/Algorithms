
# 입력 받기
n, m = map(int, input().split())
board = [input() for _ in range(n)]

# 바꿔야 하는 개수 반환
def count_recolor_grid(x, y, frame):
    count = 0
    # print(x, y)
    for dx in range(8):
        for dy in range(8):
            if frame[dx][dy] != board[x+dx][y+dy]:
                count += 1
    return count

white_row = "WBWBWBWB"
black_row = "BWBWBWBW"
frame_white_first = [white_row, black_row, white_row, black_row, white_row, black_row, white_row, black_row]
frame_black_first = [black_row, white_row, black_row, white_row, black_row, white_row, black_row, white_row]

min_count = 8 * 8
# (i, j)가 맨 왼쪽 위
for i in range(n-7): # row: i, i+1, ... , i+7
    for j in range(m-7):
        min_count = min(count_recolor_grid(i, j, frame_white_first),count_recolor_grid(i, j, frame_black_first), min_count)

print(min_count)
