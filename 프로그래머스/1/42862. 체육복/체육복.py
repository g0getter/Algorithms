def solution(n, losts, reserves):
    losts.sort()
    reserves.sort()
    # 무슨 차이인지 / 의미 있는지 확신 X
    
    set_losts = set(losts) - set(reserves)
    set_reserves = set(reserves) - set(losts)
    remaining_losts = set_losts.copy()
    
    # print(remaining_losts, set_reserves)
    for lost in set_losts:
        for reserve in set_reserves:
            if lost-1 <= reserve <= lost+1:
                remaining_losts.remove(lost)
                set_reserves.remove(reserve)
                break # 다음 lost 탐색
    
    return n - len(remaining_losts)