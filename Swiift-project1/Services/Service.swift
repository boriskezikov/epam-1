//
//  Service.swift
//  Swiift-project1
//
//  Created by Kezikov Boris  on 07.03.2020.
//  Copyright © 2020 epam. All rights reserved.
//

import Foundation
import UIKit



class Service {
    
    public static func generateRandomValue(leftBorder: Int, rightBorder:Int) -> Int {
        let tmp = Int.random(in: leftBorder..<rightBorder)
        print(tmp)
        return tmp
    }
    public static func validateInput(value: String) -> Bool {
        if (value.elementsEqual("")){
            return false
        }
          let trimmedString = value.trimmingCharacters(in: .whitespaces)
          let validated = NSPredicate(format: "SELF MATCHES %@", Constants.validationRegex)
          return validated.evaluate(with: trimmedString)
      }
    
    public static func toast(title: String, message: String, vc:UIViewController) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        vc.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil) })

    }
}
