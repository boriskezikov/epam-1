//
//  SettingsViewController.swift
//  Swiift-project1
//
//  Created by Kezikov Boris  on 09.02.2020.
//  Copyright © 2020 epam. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController{
    
    @IBOutlet weak var rightBorder: UITextField!
    @IBOutlet weak var leftBorder: UITextField!
    
    weak var delegate: SettingsVCDelegate?
    
    @IBOutlet weak var but: UIButton!
    
    @IBAction func onClick(_ sender: UIButton) {
        let leftText:String = leftBorder.text ?? "0"
        let rightText:String = rightBorder.text ?? "0"
        if (Service.validateInput(value: leftText) && Service.validateInput(value: rightText) && Int(rightText)! > Int(leftText)!){
            delegate?.callBack(left: leftText, right: rightText)
        }
        else{
            Service.toast(title: NSLocalizedString(Constants.badRequestTitle, comment:""),
                          message: NSLocalizedString(Constants.incorrectInputMessage, comment: ""),vc: self)
        }
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
    }
}

protocol SettingsVCDelegate: class  {
    func callBack(left:String, right:String)
}
