//
//  ViewController.swift
//  epam
//
//  Created by Kezikov Boris  on 21.01.2020.
//  Copyright © 2020 Kezikov Boris . All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
        
    private var magicNumber: Int = 0
    
    @IBOutlet weak var playButton:UIButton!
    
    @IBOutlet var textField: UITextField!

    
    @IBAction func readValue(_ sender: Any) {
        if validateInput(value: textField.text!) {
            if let text = textField.text, let value = Int(text) {
                if value > magicNumber {
                    
                    toast(title: NSLocalizedString(Constants.wrongTitle, comment: ""),
                          message: NSLocalizedString(Constants.lessMessage, comment: ""))
                } else if value < magicNumber {
                    toast(title: NSLocalizedString(Constants.wrongTitle, comment: ""),
                          message: NSLocalizedString(Constants.biggerMessage, comment: ""))
                } else {
                    toast(title: NSLocalizedString(Constants.successTitle,comment: ""),
                          message: NSLocalizedString(Constants.successMessage, comment: "") + String(magicNumber))
                        magicNumber = generateRandomValue()
                }
                textField.text = ""
                return
            }
            toast(title: NSLocalizedString(Constants.badRequestTitle, comment: ""),
                  message: NSLocalizedString(Constants.incorrectInputMessage, comment: ""))
        }
        toast(title: NSLocalizedString(Constants.badRequestTitle, comment:""),
              message: NSLocalizedString(Constants.incorrectInputMessage, comment: ""))
        
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.playButton.setTitle(NSLocalizedString(Constants.play, comment: ""), for: UIControl.State.normal)
        self.magicNumber = generateRandomValue()
    }
    
    private func toast(title: String, message: String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil) })
    }
    
    private func generateRandomValue() -> Int {
        let tmp = Int.random(in: 0..<100)
        return tmp
    }
    
    private func validateInput(value: String) -> Bool {
        let trimmedString = value.trimmingCharacters(in: .whitespaces)
        let validated = NSPredicate(format: "SELF MATCHES %@", Constants.validationRegex)
        return validated.evaluate(with: trimmedString)
    }
    
    
}




