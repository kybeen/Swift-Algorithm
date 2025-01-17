def solution(people, limit):
    people.sort(reverse=True)
    heavy = 0  # 무거운 사람의 인덱스
    light = len(people) - 1  # 가벼운 사람의 인덱스
    boat_count = 0

    while heavy <= light:
        if people[heavy] + people[light] <= limit:
            heavy += 1
            light -= 1
        else:
            heavy += 1
        boat_count += 1

    return boat_count