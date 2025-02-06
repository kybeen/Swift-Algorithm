struct Signal {
    let point: Int
    let period: Int
    let start: Int
    
    init(_ point: Int, _ period: Int, _ start: Int) {
        self.point = point
        self.period = period
        self.start = start
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var signals = [Signal]()

for _ in 0..<k {
    let signalInfo = readLine()!.split(separator: " ").map { Int($0)! }
    let signal = Signal(signalInfo[0], signalInfo[1], signalInfo[2])
    signals.append(signal)
}

signals.sort(by: { $0.point < $1.point })

var prevPoint = 0
var time = 0
for i in 0..<k {
    let point = signals[i].point
    let start = signals[i].start
    let period = signals[i].period
    time += (point - prevPoint)
    
    if time < start { // 아직 초록불이 된 적 없는 신호등이라면 기다림
        time += (start - time)
    }
    
    let periodCycle = (time - start) / period
    if periodCycle % 2 == 1 { // 홀수면 -> 빨간불
        // 다음 초록불까지 남은시간을 더해줌
        let nextGreenTime = ((periodCycle+1) * period) + start
        time += (nextGreenTime - time)
    }
    
    prevPoint = point
}

time += (n - prevPoint)
print(time)
