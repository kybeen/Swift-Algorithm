def solution(money):
    n = len(money)
    if n == 1:
        return money[0]
    
    # 첫 번째 집을 터는 경우
    dp_first = [0] * n
    dp_first[0] = money[0]
    dp_first[1] = money[0]
    
    for i in range(2, n - 1):  # 마지막 집은 고려 X
        dp_first[i] = max(dp_first[i - 1], dp_first[i - 2] + money[i])
    
    answer = dp_first[n - 2]
    
    # 첫 번째 집을 털지 않는 경우
    dp_no_first = [0] * n
    dp_no_first[1] = money[1]
    
    for i in range(2, n):  # 마지막 집까지 고려
        dp_no_first[i] = max(dp_no_first[i - 1], dp_no_first[i - 2] + money[i])
    
    answer = max(answer, dp_no_first[n - 1])
    
    return answer