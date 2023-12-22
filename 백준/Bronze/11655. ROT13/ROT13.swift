import Foundation

let line = Array(readLine()!)
var result = [Character]()

for chr in line {
    if chr.isLetter {
        if chr.isLowercase {
            var rotAscii = Int(UnicodeScalar(String(chr))!.value) + 13
            rotAscii = rotAscii > 122 ? rotAscii%122+96 : rotAscii
            result.append(Character(UnicodeScalar(rotAscii)!))
        } else if chr.isUppercase {
            var rotAscii = Int(UnicodeScalar(String(chr))!.value) + 13
            rotAscii = rotAscii > 90 ? rotAscii%90+64 : rotAscii
            result.append(Character(UnicodeScalar(rotAscii)!))
        }
    } else {
        result.append(chr)
    }
}
print(result.map { String($0) }.joined(separator: ""))