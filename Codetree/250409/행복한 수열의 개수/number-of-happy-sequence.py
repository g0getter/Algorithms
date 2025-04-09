n, m = map(int, input().split())
grid = [list(map(int, input().split())) for _ in range(n)]

# 행에 대해 찾고, 열에 대해 찾고 합침
def count_happy(is_row):
    count = 0
    for i in range(n):
        same_number_count = 1
        previous = -1
        for j in range(n):
            # i, j만 바뀌면 되는 것 -> x, y로 처리
            x = i if is_row else j
            y = j if is_row else i
            # print(x, y)
            if grid[x][y] == previous:
                same_number_count += 1
            else:
                same_number_count = 1
                
            previous = grid[x][y]

            if same_number_count >= m:
                count += 1
                break # 다음 줄로! 그래야 끊겨도 행복한 수열로 세어짐.

    return count

print(count_happy(True) + count_happy(False))
