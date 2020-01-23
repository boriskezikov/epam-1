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

    @IBOutlet var textField: UITextField!

    @IBAction func readValue(_ sender: Any) {
        if validateInput(value: textField.text!) {
            let userValue: Int = Int(textField.text!) ?? -1
            if userValue == -1 {
                toast(title: Constants.badRequestTitle, message: Constants.incorrectInputMessage)
                return
            }
            if userValue > magicNumber {
                toast(title: Constants.wrongTitle, message: Constants.lessMessage)
            } else if userValue < magicNumber {
                toast(title: Constants.wrongTitle, message: Constants.biggerMessage)
            } else {
                toast(title: Constants.successTitle, message: Constants.successMessage + String(magicNumber))
                magicNumber = generateRandomValue()
            }
            textField.text = ""
            return
        }
        toast(title: Constants.badRequestTitle, message: Constants.incorrectInputMessage)

    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.magicNumber = generateRandomValue()
    }

    private func toast(title: String, message: String) {
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

    
   

