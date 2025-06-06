N, M = map(int, input().split())
w, v = zip(*[tuple(map(int, input().split())) for _ in range(N)])
w, v = list(w), list(v)

# 0. tuple 하나로 만듦
# 1. [가격/무게] 내림차순 정렬
# 2. 순서대로, 가방 무게 다 채울 때까지 채움
# 3. 결과 반환

# 0. 
gems = list(zip(w, v))

# 1
# gems = sorted(gems, key=lambda arr: arr[1]/arr[0], reverse=True)

# 2
current_weight = 0
current_value = 0
for weight, value in gems:
    if current_weight >= M:
        break # return
    # 담을 수 있는 만큼 담음: min(내 무게, 남은 무게)
    weight_to_fill = min(weight, M - current_weight)
    current_weight += weight_to_fill
    current_value += value * (weight_to_fill/weight)

# 3. 결과 반환 - 소숫점 셋째자리까지 반올림
# rounded_value = round(current_value, 3) # X. 뒤에 0 생략됨
rounded_value = f"{current_value:.3f}"
print(rounded_value)