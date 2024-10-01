import Foundation

struct Song: Hashable {
    typealias ID = Int
    
    let id: Int
    let playedCount: Int
}

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    typealias Genre = String
    let songNumber = genres.count
    var musicDict: [Genre: [Song]] = [:]
    
    (0..<songNumber).forEach { id in
        let song = Song(id: id, playedCount: plays[id])
        let genre = genres[id]
        if musicDict[genre] != nil {
            musicDict[genre]!.append(song)
        } else {
            musicDict[genre] = [song]
        }
    }
    
    let bestAlbum = musicDict.sorted {
        $0.value.reduce(0) { $0 + $1.playedCount } >
        $1.value.reduce(0) { $0 + $1.playedCount }
    }.map {
        $0.value.sorted {
            if $0.playedCount == $1.playedCount {
                return $0.id < $1.id
            } else {
                return $0.playedCount > $1.playedCount
            }
        }.prefix(2)
    }.map {
        Array($0)
    }.reduce([]) {
        $0 + $1.map({ $0.id })
    }
    
    return bestAlbum
}