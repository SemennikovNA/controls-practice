//
//  ViewController.swift
//  Controls practice
//
//  Created by rezra on 17.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var orBut: UIButton!
    @IBOutlet var swithes: [UISwitch]!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    
    var numb: UInt8 = 128 {
        didSet {
            updateUi()
        }
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
        rotateSwitches()
        updateUi()
    }
    
    func rotateSwitches() {
        for item in swithes {
            item.layer.transform = CATransform3DMakeRotation(-.pi / 2, 0, 0, 1)
        }
    }
    
    
    /// Update number from the swithes set
    func updateNumberFromSwitches() {
        var number = 0
        for item in swithes {
            number += item.tag
        }
        self.numb = UInt8(number - 1 % 256)
    }
    
    /// Update swithes
    func updateSwithes() {
        
    }
    /// Updates all outlets to  number
    
    func updateUi() {
        orBut.setTitle("\(numb)", for: [])
        updateSwithes()
        slider.value = Float(numb)
        textField.text = "\(numb)"
    }
 
    
    @IBAction func butPress() {
        numb = UInt8((Int(numb)+1) % 256)
        print(#line, #function)
    }

    @IBAction func switchTogglet(_ sender: UISwitch) {
        updateNumberFromSwitches()
        print(#line, #function, sender.tag)
    }
    
    @IBAction func sliderMove() {
        numb = UInt8(slider.value)
        print(#line, #function)
    }
    
    @IBAction func textFieldEdited() {
        numb = UInt8(textField.text ?? "") ?? 128
        print(#function)
    }
    
}

