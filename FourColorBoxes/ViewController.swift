//
//  ViewController.swift
//  FourColorBoxes
//
//  Created by Mersad Meyfour Asadi on 06/10/2020.
//

import UIKit

class ViewController: UIViewController {
    
    var clockWise = true
    
    @IBOutlet weak var upLeftButton: UIButton!
    @IBOutlet weak var upRightButton: UIButton!
    @IBOutlet weak var downLeftButton: UIButton!
    @IBOutlet weak var downRightButton: UIButton!
    @IBOutlet weak var textLable: UILabel!
    @IBOutlet weak var changeDireccionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func didTappedUpLeftButton(_ sender: UIButton) {
    }
    @IBAction func didTappedUpRightButton(_ sender: UIButton) {
    }
    @IBAction func didTappedDownLeftButton(_ sender: UIButton) {
    }
    @IBAction func didTappedDownRightButton(_ sender: UIButton) {
    }
    @IBAction func didTappedChangeDirecction(_ sender: UIButton) {
        clockWise = false
        print(clockWise)
    }
    
}

