import Foundation

let ppap = Array(readLine()!)
var ppapStack = [Character]()

ppap.forEach { chr in
    ppapStack.append(chr)
    checkPPAP()
}

if ppapStack.count == 1 && ppapStack.first! == "P" {
    print("PPAP")
} else {
    print("NP")
}

func checkPPAP() {
    guard ppapStack.count >= 4 else { return }
    let lastIdx = ppapStack.count - 1
    let isMatched4 = ppapStack[lastIdx] == "P"
    let isMatched3 = ppapStack[lastIdx - 1] == "A"
    let isMatched2 = ppapStack[lastIdx - 2] == "P"
    let isMatched1 = ppapStack[lastIdx - 3] == "P"
    
    if isMatched1 && isMatched2 && isMatched3 && isMatched4 {
        ppapStack.removeLast(4)
        ppapStack.append("P")
    }
}