import Foundation

class User {
    let uid: String
    var nickname: String
    
    init(uid: String, nickname: String) {
        self.uid = uid
        self.nickname = nickname
    }
}

struct Message {
    let user: User
    let isIn: Bool
    var description: String {
        isIn
        ? "\(user.nickname)님이 들어왔습니다."
        : "\(user.nickname)님이 나갔습니다."
    }
    
    init(user: User, isIn: Bool) {
        self.user = user
        self.isIn = isIn
    }
}

func solution(_ record:[String]) -> [String] {
    var messages = [Message]()
    var userDict = [String: User]()
    
    for rec in record {
        let recComponents = rec.split(separator: " ")
        let action = recComponents[0]
        let uid = String(recComponents[1])
        
        if action == "Enter" {
            let nickname = String(recComponents[2])
            if let user = userDict[uid] { // 기존에 있던 유저
                user.nickname = nickname
                let message = Message(user: user, isIn: true)
                messages.append(message)
            } else { // 처음 들어오는 유저
                let user = User(uid: uid, nickname: nickname)
                userDict[uid] = user
                let message = Message(user: user, isIn: true)
                messages.append(message)
            }
            
        } else if action == "Leave" {
            if let user = userDict[uid] {
                let message = Message(user: user, isIn: false)
                messages.append(message)
            }
            
        } else if action == "Change" {
            let newNickname = String(recComponents[2])
            if let user = userDict[uid] {
                user.nickname = newNickname
            }
        }
    }
    
    return messages.map(\.description)
}