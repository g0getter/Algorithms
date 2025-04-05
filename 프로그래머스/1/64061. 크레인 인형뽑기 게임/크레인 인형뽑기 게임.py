# 수업 답안 #
# queue로 재구성하지 않고 있는 배열 그대로 활용
# 간결하고 빠르게
def solution(board, moves):
    bucket = []
    answer = 0

    for move in moves:
        index = move - 1
        for row in board:
            if row[index] != 0: # 유의미
                bucket.append(row[index]) # 넣고
                row[index] = 0 # 빼고
                break

        # bucket 검사
        if len(bucket) >= 2 and bucket[-2] == bucket[-1]:
            bucket = bucket[:-2]
            answer += 2
            
    return answer