/**
- 종류 별로 1개까지만
- 최소 1개 옷은 입음
*/

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    typealias ClothesType = String
    typealias ClothesName = String
    var clothesDict: [ClothesType: [ClothesName]] = [:]
    var result: Int = 1
    
    for clothesInfo in clothes {
        let name = clothesInfo[0]
        let type = clothesInfo[1]
        if clothesDict[type] != nil {
            clothesDict[type]!.append(name)
        } else {
            clothesDict[type] = [name]
        }
    }
    clothesDict.values.forEach {
        result *= ($0.count + 1)
    }
    
    return result > 0 ? result - 1 : result
}
