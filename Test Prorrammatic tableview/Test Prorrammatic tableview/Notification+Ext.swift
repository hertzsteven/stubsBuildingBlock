//
//  Notification+Ext.swift
//  Test Prorrammatic tableview
//
//  Created by Steven Hertz on 4/3/22.
//

import Foundation

extension Notification.Name: ExpressibleByStringLiteral {
    
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
    
}


// This is an either or, either use the 
extension Notification.Name {
    static let buttonTapped = Notification.Name("buttonTapped")
}

enum NotificationName: Notification.Name {
    case buttonTapped = "buttonTapped"
}
