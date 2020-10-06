//
//  ViewController.swift
//  FourColorBoxes
//
//  Created by Mersad Meyfour Asadi on 06/10/2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var upLeftButton: UIButton!
    @IBOutlet weak var upRightButton: UIButton!
    @IBOutlet weak var downLeftButton: UIButton!
    @IBOutlet weak var downRightButton: UIButton!
    @IBOutlet weak var textLable: UILabel!
    @IBOutlet weak var changeDireccionButton: UIButton!
    
    // MARK: State
    
    var clockWise = true
    var squareColor = ColoredSquare.init(location: .notSelected, isToggled: false, clockWise: true)
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: Helpers
    
    func updateUI() {
        clockWise ? (textLable.text = "Go clockwise !!") : (textLable.text = "Go counterclockwise !!")
        
        switch squareColor.location {
        case .upLeft:
            squareColor.clockWise ? (upRightButton.backgroundColor = getRandomColor()) : (downLeftButton.backgroundColor = getRandomColor())
        case .upRight:
            squareColor.clockWise ? (downRightButton.backgroundColor = getRandomColor()) : (upLeftButton.backgroundColor = getRandomColor())
        case .downLeft:
            squareColor.clockWise ? (upLeftButton.backgroundColor = getRandomColor()) : (downRightButton.backgroundColor = getRandomColor())
        case .downRight:
            squareColor.clockWise ? (downLeftButton.backgroundColor = getRandomColor()) : (upRightButton.backgroundColor = getRandomColor())
        default :break
        }
        squareColor = ColoredSquare.init(location: .notSelected, isToggled: false, clockWise: clockWise)
    }
    
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    // MARK: Action
    
    @IBAction func didTappedUpLeftButton(_ sender: UIButton) {
        squareColor = ColoredSquare.init(location: .upLeft, isToggled: true, clockWise: clockWise)
        updateUI()
    }
    @IBAction func didTappedUpRightButton(_ sender: UIButton) {
        squareColor = ColoredSquare.init(location: .upRight, isToggled: true, clockWise: clockWise)
        updateUI()
    }
    @IBAction func didTappedDownLeftButton(_ sender: UIButton) {
        squareColor = ColoredSquare.init(location: .downLeft, isToggled: true, clockWise: clockWise)
        updateUI()
    }
    @IBAction func didTappedDownRightButton(_ sender: UIButton) {
        squareColor = ColoredSquare.init(location: .downRight, isToggled: true, clockWise: clockWise)
        updateUI()
    }
    @IBAction func didTappedChangeDirecction(_ sender: UIButton) {
        clockWise.toggle()
        updateUI()
    }
    
}

