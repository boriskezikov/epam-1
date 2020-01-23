//
//  ViewController.swift
//  epam
//
//  Created by Kezikov Boris  on 21.01.2020.
//  Copyright © 2020 Kezikov Boris . All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    private let WRONG_TITLE: String = "Wrong answer"
    private let SUCCESS_TITLE: String = "Success"
    private let BIGGER_MESSAGE: String  = "Magic number is bigger"
    private let LESS_MESSAGE: String  = "Magic number is lower"
    private let SUCCESS_MESSAGE: String  = "Yes! You are right! This is: "

    private var magicNumber: Int8 = 0
    
    @IBOutlet var textField: UITextField!

   
    @IBAction func readValue(_ sender: Any) {
        let userValue: Int8 = Int8(textField.text!)! // validate how????
        
        if userValue > magicNumber{
            showAlert(title: WRONG_TITLE, message: LESS_MESSAGE)
        } else if userValue < magicNumber {
            showAlert(title: WRONG_TITLE, message: BIGGER_MESSAGE)
        } else {
            showAlert(title: SUCCESS_TITLE, message: SUCCESS_MESSAGE + String(magicNumber))
            magicNumber = generateRandomValue()
        }
        textField.text = ""
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.magicNumber = generateRandomValue()
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    }
    
    private func generateRandomValue()->Int8{
        let tmp = Int8.random(in: 0..<100 )
        print("\nGuessed number is \(tmp)")
        return tmp
    }
}

    
   

