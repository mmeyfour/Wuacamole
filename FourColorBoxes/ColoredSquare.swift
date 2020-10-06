//
//  ColoredSquare.swift
//  FourColorBoxes
//
//  Created by Mersad Meyfour Asadi on 06/10/2020.
//

import Foundation

enum ColoredSquareLocation {
    case upLeft
    case upRight
    case downLeft
    case downRight
}
enum color {
    case red
    case blue
    case orange
    case pink
}

class ColoredSquare {
    let location: ColoredSquareLocation
    var isToggled: Bool
    
    init(location: ColoredSquareLocation, isToggled: Bool){
        self.location = location
        self.isToggled = isToggled
    }
    var color: color {
        switch location {
        case .left:
            return isToggled ? .red : .blue
        case .right:
            return isToggled ? .orange : .pink
        }
    }
    
}
