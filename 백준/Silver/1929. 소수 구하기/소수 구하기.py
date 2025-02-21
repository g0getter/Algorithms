import math
import sys
from math import floor

input = 20


# 1. 에라토스테네스의 채 - 끝까지 탐색하는 버전 + TF 배열 버전
# Time complexity: O(n^2)인듯
# def find_prime_list_under_number_1(number):
def find_prime_list_under_number_1(m, n):
    lower_bound = min(m, 2)

    is_primes = [True] * (n+1) # is_primes[number] 존재하도록.
    primes = []

    # m부터 n까지 돌며
    # true이면 자기 자신은 그대로 두고, 배수들을 false로 변경
    # n까지 탐색하며 primes의 element 추가
    # return primes
    for num in range(2, n+1):
        if is_primes[num]:
            # element 추가(단, m부터!)
            if num >= m:
                primes.append(num)
            # 배수들을 false로 변경
            composite_number = num + num
            while composite_number <= n:
                is_primes[composite_number] = False
                composite_number += num

    return primes


# 1. 에라토스테네스의 채 - Root n까지 탐색하는 버전
# -> Time: O(n*rootN)인듯
def find_prime_list_under_number_2(m, n):
    if m >= 2:
        lower_bound = m
    else:
        lower_bound = 2
    # 2부터 root n까지 돌며
    # 자기 자신은 그대로 두고, 배수들을 제거
    # 0, 1 제거
    # return `primes`
    primes = list(range(n+1))
    # print(primes)
    root_number = math.sqrt(n)
    int_floor_root_number = floor(root_number) # 작거나 같은 정수 - 딱 떨어지는 경우에도 해야 함. 4->2면 2까지 검사해야함 -> range( , intRootNumber+1)


    for num in range(lower_bound, int_floor_root_number+1):
        # 배수 제거
        multiple = num + num
        while multiple <= n:
            if multiple in primes:
                primes.remove(multiple)
            multiple += num

    # 0, 1 제거
    # if m >= 2:
    #     lower_bound = m
    # else:
    #     lower_bound = 2

    for number in range(lower_bound):
        primes.remove(number)
    # primes.remove(0)
    # primes.remove(1)

    return primes

M, N = map(int, sys.stdin.readline().split())  # sys.stdin.readline() 사용 권장 (백준에서 빠름)
# result = find_prime_list_under_number_2(M, N)
# result = find_prime_list_under_number_2(input)
result = find_prime_list_under_number_1(M, N)
for prime in result: print(prime)