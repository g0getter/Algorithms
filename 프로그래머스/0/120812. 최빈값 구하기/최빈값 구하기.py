def solution(array):
    # 1. fill `count_list`
    count_list = find_alphabet_occurrence_array(array)
    
    # 2. find the maximum occurred element
    max_occurred_number = 0
    has_multiple_maxes = False
    for i in range(1, len(count_list)):
    # or
    # for i in range(len(count_list)):
        if count_list[i] > count_list[max_occurred_number]:
            max_occurred_number = i
            has_multiple_maxes = False
        elif count_list[i] == count_list[max_occurred_number]:
            has_multiple_maxes = True

    if has_multiple_maxes:
        return -1
    else:
        return max_occurred_number
    

def find_alphabet_occurrence_array(array):
    number_occurrence_array = [0] * 1000

    for number in array:
        number_occurrence_array[number] += 1

    return number_occurrence_array