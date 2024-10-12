import Foundation

struct Point {
    let row: Int
    let col: Int
}

let Nrc = readLine()!.split(separator: " ").map({ Int($0) })
let N = Nrc[0]!
let r = Nrc[1]!
let c = Nrc[2]!
let length = Int(pow(Double(2), Double(N)))

func divideConquer(length: Int, value: Int, point: Point) {
    let midLength = length / 2
    let areaOffset = midLength * midLength

    // 현재 사분면의 시작점과 일치하는 경우 종료
    if point.row == r && point.col == c {
        print(value)
        return
    }
    
    if midLength == 1 {
        if point.row == r && point.col + 1 == c { // 2사분면
            print(value + 1)
        } else if point.row + 1 == r && point.col == c { // 3사분면
            print(value + 2)
        } else { // 4사분면
            print(value + 3)
        }
        return
    }
    
    // 다음 단계 사분면으로 쪼갤 중앙점
    let midPoint = Point(row: point.row + midLength, col: point.col + midLength)
    if r < midPoint.row && c < midPoint.col { // 1사분면
        let zeroPoint = point
        divideConquer(length: midLength, value: value + (areaOffset * 0), point: zeroPoint)
    } else if r < midPoint.row && c >= midPoint.col { // 2사분면
        let zeroPoint = Point(row: point.row, col: point.col + midLength)
        divideConquer(length: midLength, value: value + (areaOffset * 1), point: zeroPoint)
    } else if r >= midPoint.row && c < midPoint.col { // 3사분면
        let zeroPoint = Point(row: point.row + midLength, col: point.col)
        divideConquer(length: midLength, value: value + (areaOffset * 2), point: zeroPoint)
    } else if r >= midPoint.row && c >= midPoint.col { // 4사분면
        let zeroPoint = Point(row: point.row + midLength, col: point.col + midLength)
        divideConquer(length: midLength, value: value + (areaOffset * 3), point: zeroPoint)
    }
}

divideConquer(length: length, value: 0, point: Point(row: 0, col: 0))