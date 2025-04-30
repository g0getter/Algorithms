import sys

_ = int(input())
original_arr = list(map(int, input().split()))

min_sum = sys.maxsize

def array_without_element(arr, i_to_remove):
    result = []
    for i in range(len(arr)):
        if i != i_to_remove:
            result.append(arr[i])

    return result

min_sum_distance = sys.maxsize

# 2배할 숫자 선택
for i in range(len(original_arr)):
    arr = original_arr.copy()
    arr[i] *= 2
    # 뺄 숫자 선택 
    for j in range(len(arr)):
        new_arr = array_without_element(arr, j)
        
        # 인접 차의 함 구함
        sum_distance = 0
        
        for k in range(0, len(new_arr)-1):
            sum_distance += abs(new_arr[k+1]-new_arr[k])
        # print("2배", i, "제외", j, new_arr, sum_distance)
        min_sum_distance = min(sum_distance, min_sum_distance)

print(min_sum_distance)