import Foundation

// 손님들이 가장 많이 함께 주문한 단품메뉴들
// - 코스요리는 2개 이상 단품메뉴
// - 최소 2명 이상 손님이 주문한 조합만 고려

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var courseMenuDict = [String: Int]()
    var courseStack = [String]()
    
    // 코스요리 조합 딕셔너리 생성을 위한 DFS 함수
    func dfs(now: Int, depth: Int, orderMenus: [String]) {
        if course.contains(depth) {
            let courseMenu = courseStack.joined(separator: "")
            if courseMenuDict[courseMenu] != nil {
                courseMenuDict[courseMenu]! += 1
            } else {
                courseMenuDict[courseMenu] = 1
            }
        }
        
        for i in now..<orderMenus.count {
            let menu = orderMenus[i]
            courseStack.append(menu)
            dfs(now: i+1, depth: depth+1, orderMenus: orderMenus)
            _ = courseStack.popLast()!
        }
    }
    
    for orderStr in orders {
        // 결과 출력 및 중복 방지를 위해서 미리 정렬
        let order = orderStr.map({ String($0) }).sorted()
        // 각 주문 별로 조합을 확인하여 딕셔너리 생성
        courseStack = []
        dfs(now: 0, depth: 0, orderMenus: order)
    }
    
    var result = [String]()
    // 코스요리 메뉴 개수 별로 가장 많이 주문된 메뉴 조합을 찾는다.
    // 2명 이상이 주문한 메뉴의 조합만 반영
    for menuCount in course {
        let menusOfCourse = courseMenuDict.filter { $0.key.count == menuCount }
        let maxOrderedCount = menusOfCourse.map(\.value).max()
        let bestCourses = menusOfCourse.filter {
            $0.value == maxOrderedCount && $0.value > 1
        }.sorted {
            $0.key < $1.key
        }.map(\.key)
        result.append(contentsOf: bestCourses)
    }
    
    return result.sorted()
}