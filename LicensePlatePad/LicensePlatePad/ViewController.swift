//
//  ViewController.swift
//  LicensePlatePad
//
//  Created by 洛格(WXL) on 2024/3/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.setupLicensePlatePad()
        textField.becomeFirstResponder()
    }


}

