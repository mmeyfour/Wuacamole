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
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: Helpers
    
    func updateUI() {
        if clockWise {
            textLable.text = "Go clockwise !!"
        } else {
            textLable.text = "Go counterclockwise !!"
        }
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
        if clockWise {
            upRightButton.backgroundColor = getRandomColor()
        } else {
            downLeftButton.backgroundColor = getRandomColor()
        }
    }
    @IBAction func didTappedUpRightButton(_ sender: UIButton) {
        if clockWise {
            downRightButton.backgroundColor = getRandomColor()
        } else {
            upLeftButton.backgroundColor = getRandomColor()
        }
    }
    @IBAction func didTappedDownLeftButton(_ sender: UIButton) {
        if clockWise {
            upLeftButton.backgroundColor = getRandomColor()
        } else {
            downRightButton.backgroundColor = getRandomColor()
        }
    }
    @IBAction func didTappedDownRightButton(_ sender: UIButton) {
        if clockWise {
            downLeftButton.backgroundColor = getRandomColor()
        } else {
            upRightButton.backgroundColor = getRandomColor()
        }
    }
    @IBAction func didTappedChangeDirecction(_ sender: UIButton) {
        print(clockWise)
        clockWise.toggle()
        updateUI()
    }
    
}

