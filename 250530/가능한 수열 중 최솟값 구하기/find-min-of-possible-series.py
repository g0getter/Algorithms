n = int(input())

# 4, 5, 6 중 하나 뽑아서 sequence의 다음 자릿수 채우고 반환 (-> n자릿수까지)
def backtracking(sequence):
    if len(sequence) == n:
        return sequence
    
    for i in ['4','5','6']:
        if not adjacent_consecutive(sequence + i):
            result = backtracking(sequence + i)
            if result:
                return result
    
# 인접한 연속 부분 수열이 동일한지 여부 반환
def adjacent_consecutive(sequence):
    # 맨 뒤를 포함해서 뒤에서부터 확인, 길이가 1, 2, 3,..인 부분 수열이 동일한지 확인
    for i in range(1, len(sequence)//2+1):
        if sequence[-i:] == sequence[-2*i:-i]:
            return True
    
    return False

print(backtracking('4'))