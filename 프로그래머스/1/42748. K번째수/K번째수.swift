// import Foundation

// func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
//     var result = [Int]()
    
//     for command in commands {
//         let i = command[0] - 1
//         let j = command[1] - 1
//         let k = command[2] - 1
        
//         let sliceArray = array[i...j].sorted()
//         result.append(sliceArray[k])
//     }
    
    
//     return result
// }

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    
    for command in commands {
        let i = command[0]
        let j = command[1]
        let k = command[2]
        
        var arr = [Int]()
        for idx in i-1...j-1 {
            arr.append(array[idx])
        }
        let resultVal = arr.sorted(by: <)[k-1]
        result.append(resultVal)
    }
    
    return result
}











