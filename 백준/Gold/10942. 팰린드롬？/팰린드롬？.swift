import Foundation

// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}
let file = FileIO()

let N = file.readInt()
var nums: [Int] = [-1]
for _ in 0..<N {
    nums.append(file.readInt())
}
let M = file.readInt()

// dp[i][j] : S=i, E=j 일 때의 팰린드롬 여부
var dp = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: N+1)

for i in 1...N {
    // S==E 일 때는 무조건 팰린드롬
    dp[i][i] = 1
    // S~E가 짝수개일 경우에는 중앙의 2개 수가 같은지 확인해서 체크해줘야함
    if i < N && nums[i] == nums[i+1]{
        dp[i][i+1] = 1
    }
}

// dp[i][i]에서 출발해서 위로 확산하면서 뻗어나가며 팰린드롬을 확인한다.
for i in stride(from: N-1, through: 2, by: -1) {
    var holOffset = 1
    var zzakOffset = 2
    
    // S~E가 홀수개인 경우 확인
    while i+holOffset <= N {
        if nums[i-holOffset] == nums[i+holOffset] {
            dp[i-holOffset][i+holOffset] = 1
        } else {
            // 팰린드롬이 아닌 곳이 나오면 더 확인할 필요가 없음 (더 뻗어도 더 이상 팰린드롬이 아니기 때문에)
            break
        }
        
        holOffset += 1
    }
    
    // S~E가 짝수개인 경우 확인
    if dp[i][i+1] == 1 && i <= N-2 {
        while i+zzakOffset <= N {
            if nums[i-zzakOffset+1] == nums[i+zzakOffset] {
                dp[i-zzakOffset+1][i+zzakOffset] = 1
            } else {
                // 팰린드롬이 아닌 곳이 나오면 더 확인할 필요가 없음 (더 뻗어도 더 이상 팰린드롬이 아니기 때문에)
                break
            }
            
            zzakOffset += 1
        }
    }
}

var result = ""
for _ in 0..<M {
    let (S, E) = (file.readInt(), file.readInt())
    result += "\(dp[S][E])\n"
}

print(result)