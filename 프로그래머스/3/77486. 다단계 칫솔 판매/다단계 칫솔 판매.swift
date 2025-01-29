import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var profit = [String: Int]()
    var inviter = [String: String]()
    
    for i in 0..<enroll.count {
        inviter[enroll[i]] = referral[i]
    }
    // for e in enroll {
    //     print("\(e)를 추천한 사람 \(inviter[e]!)")
    // }
    
    for i in 0..<seller.count {
        var nowSeller = seller[i]
        var cost = amount[i] * 100
        
        while nowSeller != "-", cost > 0 {
            let charge = cost / 10 // 수수료
            let realProfit = cost - Int(charge) // 순이익
            if nowSeller != "-" {
                profit[nowSeller, default: 0] += realProfit
                cost = charge
                nowSeller = inviter[nowSeller]!
            }
        }
    }
    
    return enroll.map { profit[$0, default: 0] }
}