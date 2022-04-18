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
    
    var numb = 128 {
        didSet {
            numb = (numb + 256) % 256
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
            number += item.isOn ? item.tag : 0
        }
        self.numb = number
    }
    
    /// Update swithes
    func updateSwithes() {
        for item in swithes {
            item.isOn = Int(numb) & item.tag != 0
        }
    }
    /// Updates all outlets to  number
    
    func updateUi() {
        orBut.setTitle("\(numb)", for: [])
        updateSwithes()
        slider.value = Float(numb)
        textField.text = "\(numb)"
    }
 
    
    @IBAction func butPress() {
        numb += 1
        print(#line, #function)
    }

    @IBAction func switchTogglet(_ sender: UISwitch) {
        updateNumberFromSwitches()
        print(#line, #function, sender.tag)
    }
    
    @IBAction func sliderMove() {
        numb = Int(slider.value)
        print(#line, #function)
    }
    
    @IBAction func textFieldEdited() {
        numb = Int(textField.text ?? "") ?? 128
        print(#function)
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        if location.x < view.bounds.midX {
            numb -= 1
        } else {
            numb += 1
        }
    }
    
}

