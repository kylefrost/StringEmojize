//
//  ViewController.swift
//  StringEmojize
//
//  Created by Kyle Frost on 2/9/15.
//  Copyright (c) 2015 Kyle Frost. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var showLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func convertButton(sender: UIButton) {
        
        var myString = textField.text
        showLabel.text = myString.emojizedString()
    }
}

