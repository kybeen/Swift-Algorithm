import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var parents = [String: String]()
    var profits = [String: Int]()
    
    for i in 0..<enroll.count {
        parents[enroll[i]] = referral[i]
        profits[enroll[i]] = 0
    }
    
    func calculateProfit(name: String, value: Int) {
        guard name != "-" else { return }
        let charge = value / 10
        let profit = value - charge
        profits[name]! += profit
        
        guard charge > 0 else { return }
        let parent = parents[name]!
        calculateProfit(name: parent, value: charge)
    }
    
    for i in 0..<seller.count {
        let sellerName = seller[i]
        let amountValue = amount[i] * 100
        calculateProfit(name: sellerName, value: amountValue)
        
    }
    
    var result = [Int]()
    for enr in enroll {
        result.append(profits[enr]!)
    }
    
    return result
}