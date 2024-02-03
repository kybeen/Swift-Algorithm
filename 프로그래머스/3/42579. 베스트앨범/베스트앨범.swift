import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var songs = [String: [(Int, Int)]]() // 장르별 노래들 => [장르 : [(고유번호, 재생횟수)]]
    var genrePlayCnt = [String: Int]() // 장르별 총 재생 횟수 => [장르 : 재생 횟수]
    // 딕셔너리 키 세팅
    for genre in genres {
        if songs[genre] == nil {
            songs[genre] = [(Int, Int)]()
            genrePlayCnt[genre] = 0
        }
    }
    // 딕셔너리 값 세팅
    for i in 0..<plays.count {
        let genre = genres[i]
        songs[genre]!.append((i, plays[i]))
        genrePlayCnt[genre]! += plays[i]
    }
    
    var playCnt = [Int]() // 재생 횟수
    var bestGenres = [String]() // 총 재생 횟수가 많은 순서대로 들어 있는 장르
    for (_, value) in genrePlayCnt {
        playCnt.append(value)
    }
    // 재생 횟수가 많은 장르부터 bestGenres 배열에 넣어준다.
    for cnt in playCnt.sorted(by: >) {
        for (key, value) in genrePlayCnt {
            if value == cnt {
                bestGenres.append(key)
            }
        }
    }
    
    var result = [Int]()
    // 각 장르의 노래들을 많이 재생된 순서로 정렬
    for (key, value) in songs {
        songs[key]!.sort { $0.1 > $1.1 }
    }
    for bestGenre in bestGenres {
        // 첫 번째 노래
        result.append(songs[bestGenre]![0].0)
        // 장르에 속한 곡이 2곡 이상이면 2번째 곡도 추가
        if songs[bestGenre]!.count > 1 {
            result.append(songs[bestGenre]![1].0)
        }
    }
    
    return result
}