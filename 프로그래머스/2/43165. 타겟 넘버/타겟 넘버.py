def solution(numbers, target):
    # print("me:",array[0],"array:",array, "target:", target)
    if len(numbers) == 0: 
        return 0
    if len(numbers) == 1: 
        return 1 if numbers[0] == target or numbers[0] * (-1) == target else 0

    me = numbers[0]
    
    # ways_plus + ways_minus
    return solution(numbers[1:], target - me) + solution(numbers[1:], target + me)