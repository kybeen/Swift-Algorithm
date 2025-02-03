let T = Int(readLine()!)!
for process in 0..<T {
    print("Material Management \(process+1)")
    let N = Int(readLine()!)! // 부품 개수
    let _ = readLine()!.split(separator: " ").map { Int($0)! }
    for _ in 0..<N {
        let _ = readLine()!.split(separator: " ").map { Int($0)! }
    }
    print("Classification ---- End!")
}