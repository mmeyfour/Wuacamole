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
    @IBOutlet weak var upLeftMole: UIImageView!
    @IBOutlet weak var upRightMole: UIImageView!
    @IBOutlet weak var downLeftMole: UIImageView!
    @IBOutlet weak var downRightMole: UIImageView!
    
    // MARK: State
    
    var clockWise = true
    var squareColor = ColoredSquare.init(location: .notSelected, isToggled: false, clockWise: true)
    var rightMoleTop = false
    var leftMoleTop = false
    var leftDownMole = false
    var righDownMole = false
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    
    }
   
    // MARK: Helpers
    
    func updateUI() {
        
        let number = Int.random(in: 1...4)
        switch number {
        case 1:
            self.upLeftButton.setBackgroundImage(#imageLiteral(resourceName: "mole"), for: .normal)
            self.upRightButton.setBackgroundImage(nil, for: .normal)
            self.downRightButton.setBackgroundImage(nil, for: .normal)
            self.downLeftButton.setBackgroundImage(nil, for: .normal)
            leftMoleTop = true
        case 2:
            self.upLeftButton.setBackgroundImage(nil, for: .normal)
            self.upRightButton.setBackgroundImage(#imageLiteral(resourceName: "mole"), for: .normal)
            self.downRightButton.setBackgroundImage(nil, for: .normal)
            self.downLeftButton.setBackgroundImage(nil, for: .normal)
            rightMoleTop = true
        case 3:
            self.upLeftButton.setBackgroundImage(nil, for: .normal)
            self.upRightButton.setBackgroundImage(nil, for: .normal)
            self.downRightButton.setBackgroundImage(nil, for: .normal)
            self.downLeftButton.setBackgroundImage(#imageLiteral(resourceName: "mole"), for: .normal)
            leftDownMole = true
        case 4:
            self.upLeftButton.setBackgroundImage(nil, for: .normal)
            self.upRightButton.setBackgroundImage(nil, for: .normal)
            self.downRightButton.setBackgroundImage(#imageLiteral(resourceName: "mole"), for: .normal)
            self.downLeftButton.setBackgroundImage(nil, for: .normal)
            righDownMole = true
            
        default:
            self.downLeftButton.setBackgroundImage(nil, for: .normal)
            self.upRightButton.setBackgroundImage(nil, for: .normal)
            self.downRightButton.setBackgroundImage(nil, for: .normal)
            self.upLeftButton.setBackgroundImage(nil, for: .normal)
            
        }
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
        
        if rightMoleTop && clockWise || (leftDownMole && clockWise == false) {
            print("acierto")
        } else {
            print("fallo")
        }
        rightMoleTop = false
        leftDownMole = false
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
