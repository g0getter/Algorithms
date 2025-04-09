n, m = map(int, input().split())
grid = [list(map(int, input().split())) for _ in range(n)]

# Please write your code here.
def count_happy_row():
    count = 0
    for i in range(n):
        same_number_count = 1
        previous = -1
        for j in range(n):
            # print(i, j)
            if grid[i][j] == previous:
                same_number_count += 1
            else:
                same_number_count = 1
                
            previous = grid[i][j]

            if same_number_count >= m:
                count += 1
                break # 다음 줄로! 그래야 끊겨도 행복한 수열로 세어짐.

    return count

def count_happy_column():
    count = 0
    for j in range(n):
        same_number_count = 1
        previous = -1
        for i in range(n):
            # print(i, j)
            if grid[i][j] == previous:
                same_number_count += 1
            else:
                same_number_count = 1
                
            previous = grid[i][j]

            if same_number_count >= m:
                count += 1
                break # 다음 줄로! 그래야 끊겨도 행복한 수열로 세어짐.

    return count

print(count_happy_row() + count_happy_column())