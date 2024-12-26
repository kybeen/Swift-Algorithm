import Foundation

// 1. 재생 많은 장르
// 2. 재생 많은 노래
// 3. 고유번호 낮은 노래
struct Music {
    let id: Int
    let playedCount: Int
}

struct GenreInfo {
    var musics: [Music]
    var totalPlayedCount: Int {
        musics.reduce(0) { $0 + $1.playedCount }
    }
}

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genreDict = [String: GenreInfo]()
    let musicCount = genres.count
    
    for id in 0..<musicCount {
        let genre = genres[id]
        let music = Music(id: id, playedCount: plays[id])
        
        if genreDict[genre] != nil {
            genreDict[genre]!.musics.append(music)
        } else {
            genreDict[genre] = GenreInfo(musics: [music])
        }
    }
    
    var bestAlbum = [Int]()
    
    // 재생 횟수가 많은 장르
    let topGenres = genreDict
    .sorted {$0.value.totalPlayedCount > $1.value.totalPlayedCount }
    .map(\.key)
    
    for genre in topGenres {
        // 각 장르 별 재생 횟수가 많은 노래들
        let sortedMusics = genreDict[genre]!.musics.sorted {
            if $0.playedCount == $1.playedCount {
                return $0.id < $1.id
            } else {
                return $0.playedCount > $1.playedCount
            }
        }
        // 장르 별 최대 2곡까지 수록
        if let top = sortedMusics.first {
            bestAlbum.append(top.id)
        }
        if sortedMusics.count > 1 {
            bestAlbum.append(sortedMusics[1].id)
        }
    }
    
    return bestAlbum
}