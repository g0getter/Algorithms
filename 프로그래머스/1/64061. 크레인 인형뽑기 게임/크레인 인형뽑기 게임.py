from collections import deque

def solution(board, moves):
    bucket = []
    num_removed = 0

    # board -> queue N개로 변환
    queues = []
    for j in range(len(board[0])):
        queue = deque()
        for i in range(len(board)):
            if board[i][j] == 0: continue
            queue.append(board[i][j])
        queues.append(queue)

    # print(queues)

    # moves 돌면서 해당 큐 popLeft, 바구니 stack peek()(=last)과 같으면 바구니 pop, 다르면 바구니에 append
    for move in moves:
        queue_num = move - 1
        if queues[queue_num]:
            doll = queues[queue_num].popleft()
        else: continue

        if bucket:
            last_doll_in_bucket = bucket[len(bucket)-1]
            if doll == last_doll_in_bucket:
                bucket.pop()
                num_removed += 2
            else:
                bucket.append(doll)
        else:
            bucket.append(doll)

    return num_removed