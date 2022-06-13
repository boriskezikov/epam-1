//
//  ViewController.swift
//  epam
//
//  Created by Kezikov Boris  on 21.01.2020.
//  Copyright © 2020 Kezikov Boris . All rights reserved.
//

import UIKit


class ViewController: UIViewController, SettingsVCDelegate {
    private var leftBorder: Int = 0;
    private var rightBorder: Int = 0;
    private var gamesPlayedCounter: Int = 0
    private var magicNumber: Int = 0
    private static var counter: Int = 0
    private var settingVC: SettingsViewController!
    
    @IBOutlet weak var triesCounter: UILabel!
    @IBOutlet weak var playButton:UIButton!
    @IBOutlet var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playButton.setTitle(NSLocalizedString(Constants.play, comment: ""), for: UIControl.State.normal)
        self.triesCounter.text = NSLocalizedString(Constants.tries,comment: "") + "0"
        instantiateSwipes()
        Service.toast(title: NSLocalizedString(Constants.welcomeTitle,comment: ""),
                      message: NSLocalizedString(Constants.welcomeMessage, comment: ""), vc: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (checkParams()){
            self.magicNumber = Service.generateRandomValue(leftBorder: leftBorder, rightBorder: rightBorder)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "StatisticsSegue":
            guard let dest = segue.destination as? StatisticsViewController else {return}
            dest.gamesCount = String(gamesPlayedCounter)
        case "SettingSegue":
            guard let dest = segue.destination as? SettingsViewController else {return}
            dest.delegate = self
        default:
            break
        }
    }
    
    @IBAction func readValue(_ sender: Any) {
        if Service.validateInput(value: textField.text!) {
            if let text = textField.text, let value = Int(text) {
                ViewController.counter += 1
                
                self.triesCounter.text = NSLocalizedString(Constants.tries,comment: "") + String(ViewController.counter)
                
                if value > magicNumber {
                    
                    Service.toast(title: NSLocalizedString(Constants.wrongTitle, comment: ""),
                                  message: NSLocalizedString(Constants.lessMessage, comment: ""), vc: self)
                } else if value < magicNumber {
                    Service.toast(title: NSLocalizedString(Constants.wrongTitle, comment: ""),
                                  message: NSLocalizedString(Constants.biggerMessage, comment: ""), vc: self)
                } else {
                    Service.toast(title: NSLocalizedString(Constants.successTitle,comment: ""),
                                  message: NSLocalizedString(Constants.successMessage, comment: "") + String(magicNumber),vc: self)
                    magicNumber = Service.generateRandomValue(leftBorder: leftBorder, rightBorder: rightBorder)
                    ViewController.counter = 0
                    gamesPlayedCounter += 1
                    self.triesCounter.text = NSLocalizedString(Constants.tries,comment: "") + String(ViewController.counter)
                }
                textField.text = ""
                return
            }
            Service.toast(title: NSLocalizedString(Constants.badRequestTitle, comment: ""),
                          message: NSLocalizedString(Constants.incorrectInputMessage, comment: ""),vc: self)
        }
        Service.toast(title: NSLocalizedString(Constants.badRequestTitle, comment:""),
                      message: NSLocalizedString(Constants.incorrectInputMessage, comment: ""),vc: self)
        
    }
    
    @objc func handleSwipes(_ gesture: UISwipeGestureRecognizer) {
        switch gesture.direction{
            case .right:
                performSegue(withIdentifier: "SettingSegue", sender: self)
            case .left:
                performSegue(withIdentifier: "StatisticsSegue", sender: self)
            default:
                break
            }
    }
    
    private func instantiateSwipes(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        swipeRight.direction = .right
        swipeLeft.direction = .left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    private func checkParams()->Bool{
        if rightBorder != 0 && leftBorder != 0{
            playButton.isEnabled = true
            textField.isEnabled = true
        }
        else {
            playButton.isEnabled = false
            textField.isEnabled = false
        }
        return playButton.isEnabled
    }
    
    func callBack(left: String, right: String) {
        self.leftBorder = Int(left)!
        self.rightBorder = Int(right)!
        print("Boards updated")
    }
}




