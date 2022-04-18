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
    
    var number: UInt8 = 128 {
        didSet {
            updateUi()
        }
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    
    /// Updates all outlets to  number
    
    func updateUi() {
        orBut.setTitle("\(number)", for: [])
        //TODO: set swithes to number
        slider.value = Float(number)
        textField.text = "\(number)"
    }
 
    
    @IBAction func butPress() {
        number = UInt8((Int(number)+1) % 256)
        print(#line, #function)
    }

    @IBAction func switchTogglet(_ sender: UISwitch) {
        print(#line, #function, sender.tag)
    }
    
    @IBAction func sliderMove() {
        number = UInt8(slider.value)
        print(#line, #function)
    }
    
    @IBAction func textFieldEdited() {
        number = UInt8(textField.text ?? "") ?? 128
        print(#function)
    }
    
}

