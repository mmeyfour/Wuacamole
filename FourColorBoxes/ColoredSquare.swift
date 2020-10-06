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
    case notSelected
}
enum color {
    case RandomColorOne
    case RandomColorTwo
    case RandomColorThree
    case RandomeColorFour
    case RandomColorFive
    case RandomColorSix
    case RandomColorSeven
    case RandomeColorEight
}

class ColoredSquare {
    let location: ColoredSquareLocation
    var isToggled: Bool
    var clockWise: Bool
    
    init(location: ColoredSquareLocation, isToggled: Bool, clockWise: Bool ){
        self.location = location
        self.isToggled = isToggled
        self.clockWise = clockWise
    }
    var color: color {
        switch location {
        case .upLeft:
            return isToggled ? .RandomColorOne : .RandomColorTwo
        case .upRight:
            return isToggled ? .RandomColorThree : .RandomeColorFour
        case .downLeft:
            return isToggled ? .RandomColorFive : .RandomColorSix
        case .downRight:
            return isToggled ? .RandomColorSeven : .RandomeColorEight
        case .notSelected:
            return isToggled ? .RandomColorSeven : .RandomeColorEight
        }
    }
    
}
