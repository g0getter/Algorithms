def solution(n, losts, reserves):
    losts.sort()
    reserves.sort()
    
    # 일단 동일한 것 제외 필수 - 그 어떤 곳에도 속하지 않게 해야하므로.
    set_losts = set(losts) - set(reserves)
    set_reserves = set(reserves) - set(losts)
    
    # 본인 못 받았는지 체크 -> 주변 여분 확인 -> 양쪽 중 하나에서 빼기. <- 경쟁 가능.. -> 생각할 것 많고 복잡
    # Solution1. losts 기준 - 누구에게 빌려갈지 ((-)중복 빌려가기 가능 -> 빼기 필요)
    # remaining_losts = set_losts.copy()
    
#     for lost in sorted(set_losts):
#         if lost-1 in set_reserves:
#             remaining_losts.remove(lost)
#             set_reserves.remove(lost-1)
            
#         elif lost+1 in set_reserves:
#             remaining_losts.remove(lost)
#             set_reserves.remove(lost+1)

    # OR
    
    # 본인이 빌려줄 수 있는 가장 가까운 사람 한 명 선택 -> 끝. -> 간단
    # Solution2. reserves 기준 - 누구에게 줄지 ((+)한 번만 빌려주기 가능)
    for reserve in set_reserves:
            if reserve-1 in set_losts:
                set_losts.remove(reserve-1) # set_losts 변경해도 됨
            # set_reserves.remove(lost) # 이미 지나갈 것이므로 제할 필요 없음
            elif reserve+1 in set_losts:
                set_losts.remove(reserve+1)
    
    return n - len(set_losts)