def solution(triangle):
    # 위치 k인 수 N까지 오는 길의 최댓값 M(k)
    # 정확히는, triangle[i][j] 인 수까지의 최댓값을 M(i, j ~~)이라 했을 때
    # M(i, j위치의 수) = max(M(i-1, j-1 위치의 수), M(i-1, j 위치의 수)) +(i, j 위치의 수) (단, i >=1, 0<j<최대인덱스)
    answer = 0
    max_triangle = triangle
    
    for i in range(1, len(triangle)):
        
        for j in range(len(triangle[i])):
            # if i == 0:
            #     max_triangle[i][j] = triangle[i][j]
            #     continue
            if j == 0:
                max_triangle[i][j] = max_triangle[i-1][j] + triangle[i][j]
            # elif j == len(level_nums)-1:
            elif j == len(triangle[i])-1:
                max_triangle[i][j] = max_triangle[i-1][j-1] + triangle[i][j]
            else:
                max_triangle[i][j] = max(max_triangle[i-1][j-1], max_triangle[i-1][j]) + triangle[i][j]
                
    return max(max_triangle[-1])
