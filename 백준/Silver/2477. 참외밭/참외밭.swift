import Foundation

/*
 - [동서]와 [남북] 각각의 한쪽 방향은 무조건 1번만 나옴 => 직사각형 가로/세로의 길이
 - ABAB 형식으로 반복되는 구간의 가운데 2개 길이가 직사각형의 잘리는 부분 ex) 남[동남]동의 가운데 [동남]
 */
let K = Int(readLine()!)! // 1m^2에 자라는 참외 개수

var width = 0 // 전체 직사각형의 가로 길이
var height = 0 // 전체 직사각형의 세로 길이

var input = [(direction: Int, length: Int)]()
// 동1 서2 남3 북4
for _ in 0..<6 {
    let read = readLine()!.split(separator: " ").map { Int($0)! }
    let direction = read[0]
    let length = read[1]
    input.append((direction, length))
    
    // 가로/세로 길이 구하기
    if [1, 2].contains(direction) { // 동,서
        width = max(width, length)
    } else { // 남,북
        height = max(height, length)
    }
}

var total = width * height // 전체 직사각형 넓이
var remove = 0 // 제거할 넓이

// ABAB 형태로 이동하는 구간 찾기
for a in 0..<6 {
    let b = (a+1)%6
    let nextTwoA = (a+2)%6 // A의 2칸 뒤 인덱스
    let nextTwoB = (b+2)%6 // B의 2칸 뒤 인덱스
    
    // ABAB 형식으로 움직이는 방향이라면
    if (input[a].direction == input[nextTwoA].direction) &&
        (input[b].direction == input[nextTwoB].direction) {
        remove = (input[b].length * input[nextTwoA].length)
    }
}

print(K * (total - remove))