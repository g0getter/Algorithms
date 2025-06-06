N, M = map(int, input().split())
# 0. tuple 하나로 만듦
gems = [
    tuple(map(int, input().split()))
    for _ in range(N)
    ]

# 1. [가격/무게] 내림차순 정렬
# 2. 순서대로, 가방 무게 다 채울 때까지 채움
# 3. 결과 반환


# 1
gems = sorted(gems, key=lambda arr: arr[1]/arr[0], reverse=True)
# gems.sort(key=lambda arr: -arr[1]/arr[0]) # 도 가능하나 의도 명확성 떨어짐

# 2 | Solution1: current_weight 새로 만듦
# current_weight = 0
# current_value = 0
# for weight, value in gems:
#     if current_weight >= M:
#         break # return
#     # 담을 수 있는 만큼 담음: min(내 무게, 남은 무게)
#     weight_to_fill = min(weight, M - current_weight)
#     current_weight += weight_to_fill
#     current_value += value * (weight_to_fill/weight)

# 2 | Solution2: 불변과 가변을 구분하고, 가변만 추적 - M을 '잔여무게'로 설정 후 그대로 사용
current_value = 0
for weight, value in gems:
    if M >= weight: # 그냥 다 넣음
        current_value += value
        M -= weight
        
    else: # 쪼개서 넣음 + 끝났으므로 break
        current_value += value * (M/weight)
        M = 0
        break

# 3. 결과 반환 - 소숫점 셋째자리까지 반올림
# rounded_value = round(current_value, 3) # X. 뒤에 0 생략됨
rounded_value = f"{current_value:.3f}"
print(rounded_value)

