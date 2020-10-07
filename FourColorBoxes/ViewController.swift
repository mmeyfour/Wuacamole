//
//  ViewController.swift
//  Wuacamole
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
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    // MARK: State
    
    var clockWise = true
    var squareColor = ColoredSquare.init(location: .notSelected, isToggled: false, clockWise: true)
    var leftUpMole = false
    var rightUpMole = false
    var leftDownMole = false
    var rightDownMole = false
    var winCounter = 0
    var loseCounter = 0
    
    
    enum MolePosition{
        case rightUpMole
        case leftUpMole
        case rightDownMole
        case leftDownMole
        case none
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    // MARK: Helpers
    
    func updateUI() {
        
        let number = Int.random(in: 1...4)
        clockWise = Bool.random()
        self.upLeftButton.setBackgroundImage(nil, for: .normal)
        self.upRightButton.setBackgroundImage(nil, for: .normal)
        self.downRightButton.setBackgroundImage(nil, for: .normal)
        self.downLeftButton.setBackgroundImage(nil, for: .normal)
        winLabel.text = "Win: \(winCounter)"
        loseLabel.text = "Lose: \(loseCounter)"
        booleanMole(molePosition: .none)
        
        switch number {
            case 1:
                self.upLeftButton.setBackgroundImage(#imageLiteral(resourceName: "mole"), for: .normal)
                booleanMole(molePosition: .leftUpMole)
            case 2:
                self.upRightButton.setBackgroundImage(#imageLiteral(resourceName: "mole"), for: .normal)
                booleanMole(molePosition: .rightUpMole)
            case 3:
                self.downLeftButton.setBackgroundImage(#imageLiteral(resourceName: "mole"), for: .normal)
                booleanMole(molePosition: .leftDownMole)
            case 4:
                self.downRightButton.setBackgroundImage(#imageLiteral(resourceName: "mole"), for: .normal)
                booleanMole(molePosition: .rightDownMole)
            default:
                break
                
        }
        
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
        clockWise ? (textLable.text = "Go clockwise !!↩️ ") : (textLable.text = "Go counterclockwise !!↪️")
        squareColor = ColoredSquare.init(location: .notSelected, isToggled: false, clockWise: clockWise)
        slider.minimumTrackTintColor = getRandomColor()
    }
    
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func booleanMole(molePosition: MolePosition){
        
        switch molePosition {
            case .rightUpMole:
                rightUpMole = true
            case .leftUpMole:
                leftUpMole = true
            case .rightDownMole:
                rightDownMole = true
            case .leftDownMole:
                leftDownMole = true
            default:
                rightUpMole = false
                leftUpMole = false
                rightDownMole = false
                leftDownMole = false
        }
    }
    
    // MARK: Action
    
    @IBAction func didTappedUpLeftButton(_ sender: UIButton) {
        squareColor = ColoredSquare.init(location: .upLeft, isToggled: true, clockWise: clockWise)
        if (rightUpMole && clockWise) || (leftDownMole && !clockWise) {
            print("acierto")
            winCounter += 1
        } else {
            print("fallo")
            loseCounter += 1
        }
        updateUI()
    }
    @IBAction func didTappedUpRightButton(_ sender: UIButton) {
        squareColor = ColoredSquare.init(location: .upRight, isToggled: true, clockWise: clockWise)
        if (rightDownMole && clockWise) || (leftUpMole && !clockWise) {
            print("acierto")
            winCounter += 1
        } else {
            print("fallo")
            loseCounter += 1
        }
        updateUI()
    }
    @IBAction func didTappedDownLeftButton(_ sender: UIButton) {
        squareColor = ColoredSquare.init(location: .downLeft, isToggled: true, clockWise: clockWise)
        if  (leftUpMole && clockWise) || (rightDownMole && !clockWise) {
            print("acierto 🥳")
            winCounter += 1
        } else {
            print("fallo 🥺")
            loseCounter += 1
        }
        updateUI()
    }
    @IBAction func didTappedDownRightButton(_ sender: UIButton) {
        squareColor = ColoredSquare.init(location: .downRight, isToggled: true, clockWise: clockWise)
        if  (leftDownMole && clockWise) || (rightUpMole && !clockWise) {
            print("acierto 🥳")
            winCounter += 1
        } else {
            print("fallo 🥺")
            loseCounter += 1
        }
        updateUI()
    }
    @IBAction func didTappedChangeDirecction(_ sender: UIButton) {
        winCounter = 0
        loseCounter = 0
        updateUI()
    }
    @IBAction func didMoveSlider(_ sender: UISlider) {
        changeDireccionButton.alpha = CGFloat(slider.value)
        //print(slider.value)
        let number = Int(slider.value*100)
        print(number)
        if number % 20 == 0 {
            print(number)
            slider.minimumTrackTintColor = getRandomColor()
        }
    }
    
}
