import Foundation

struct MyDate: Comparable {
    let year: Int
    let month: Int
    let day: Int
    
    init(_ dateStr: String) {
        let d = dateStr.components(separatedBy: ".")
        self.year = Int(d[0])!
        self.month = Int(d[1])!
        self.day = Int(d[2])!
    }
    
    init(_ year: Int, _ month: Int, _ day: Int) {
        self.year = year
        self.month = month
        self.day = day
    }
    
    func addMonth(_ duration: Int) -> MyDate {
        var (nYear, nMonth, nDay) = (year, month, day)
        nMonth += duration
        nDay -= 1
        
        if nMonth > 12 {
            nYear += (nMonth / 12)
            nMonth = (nMonth % 12)
        }
        if nDay == 0 {
            nMonth -= 1
            nDay = 28
        }
        if nMonth == 0 {
            nYear -= 1
            nMonth = 12
        }
        return MyDate(nYear, nMonth, nDay)
    }
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        if lhs.year != rhs.year {
            return lhs.year < rhs.year
        } else if lhs.month != rhs.month {
            return lhs.month < rhs.month
        } else {
            return lhs.day < rhs.day
        }
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return (lhs.year == rhs.year) && (lhs.month == rhs.month) && (lhs.day == rhs.day)
    }
}

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var expireDuration = [String: Int]()
    for term in terms {
        let t = term.components(separatedBy: " ")
        let termName = t[0]
        let duration = Int(t[1])!
        expireDuration[termName] = duration
    }
    
    var result = [Int]()
    let todayDate = MyDate(today)
    for i in 0..<privacies.count {
        let privacy = privacies[i].components(separatedBy: " ")
        let collectDate = MyDate(privacy[0])
        let termName = privacy[1]
        let duration = expireDuration[termName]!
        let expireDate = collectDate.addMonth(duration)
        
        if todayDate > expireDate {
            result.append(i+1)
        }
    }
    
    return result
}