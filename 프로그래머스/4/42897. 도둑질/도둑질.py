def solution(money):
    n = len(money)
    # dpFirst : 첫번째 집을 터는 경우의 DP 테이블
    # dpLast : 마지막 집을 터는 경우의 DP 테이블
    dpFirst = [0] * n
    dpLast = [0] * n
    
    # 첫번째 집 터는 경우
    dpFirst[0] = money[0]
    dpFirst[1] = dpFirst[0]
    for i in range(2, n-1):
        dpFirst[i] = max(dpFirst[i-1], dpFirst[i-2] + money[i])
    
    # 마지막 집 터는 경우
    dpLast[0] = 0
    dpLast[1] = money[1]
    for i in range(2, n):
        dpLast[i] = max(dpLast[i-1], dpLast[i-2] + money[i])
    
    return max(max(dpFirst), max(dpLast))