struct SimilarWord: Hashable {
    let word: String
    let idx: Int
    
    init(_ word: String, _ idx: Int) {
        self.word = word
        self.idx = idx
    }
}

func getPrefixLength(_ wordA: [String], _ wordB: [String]) -> Int {
    var idx = 0
    var length = 0
    
    while idx < wordA.count && idx < wordB.count {
        if wordA[idx] == wordB[idx] {
            length += 1
            idx += 1
        } else {
            break
        }
    }
    return length
}

let N = Int(readLine()!)!
var words = [SimilarWord]()
for idx in 0..<N {
    words.append(SimilarWord(readLine()!, idx))
}
words.sort { $0.word < $1.word }

var similarWords = Set<SimilarWord>()
var maxLen = 0
for a in 0..<N {
    let wordA = words[a].word.map({ String($0) })
    for b in a+1..<N {
        let wordB = words[b].word.map({ String($0) })
        let prefixLen = getPrefixLength(wordA, wordB)
        if prefixLen > maxLen { // 가장 비슷한 단어 갱신
            maxLen = prefixLen
            similarWords = Set<SimilarWord>()
            similarWords.insert(words[a])
            similarWords.insert(words[b])
        } else if prefixLen == maxLen { // 현재 가장 비슷한 단어 추가
            similarWords.insert(words[a])
            similarWords.insert(words[b])
        } else {
            break
        }
    }
}

// 가장 먼저 입력된 단어(S)를 기준으로 동일한 접두어를 갖는 단어 중 가장 먼저 입력된 단어(T)를 구해준다.
let S = similarWords.sorted(by: { $0.idx < $1.idx })[0]
let T = similarWords.filter {
    ($0.idx != S.idx) && ($0.word.first == S.word.first)
}.sorted {
    $0.idx < $1.idx
}[0]
print(S.word)
print(T.word)