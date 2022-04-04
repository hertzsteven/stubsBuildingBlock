import Cocoa

    import  AppKit

struct StatusColor: Equatable, ExpressibleByStringLiteral {
    
    init(stringLiteral value: StringLiteralType) {
        hex = value
    }
    
        var hex: String
        
        var color: NSColor {
            var intHex: UInt64 = 0
            let scanner = Scanner(string: hex)
            scanner.scanHexInt64(&intHex)
            let red = CGFloat((intHex & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((intHex & 0xFF00) >> 8) / 255.0
            let blue = CGFloat((intHex & 0xFF)) / 255.0
            return NSColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }

enum StatusIndication: StatusColor {
    case inProgress = "0000ff"
    case completed = "00ff00"
    case stopped = "181818"
    case failed = "ff0000"
}
