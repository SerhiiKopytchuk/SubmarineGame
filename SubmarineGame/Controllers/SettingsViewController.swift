//
//  SettingsViewController.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 02.02.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var AboutAuthorButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var chooseFirstButton: UIButton!
    @IBOutlet weak var chooseSecondButton: UIButton!
    @IBOutlet weak var chooseThirdButton: UIButton!
    @IBOutlet weak var youreNameLabel: UILabel!
    @IBOutlet weak var reloadMissilesLabel: UILabel!
    @IBOutlet weak var reloadOxygenLabel: UILabel!
    @IBOutlet weak var missilesOnStartLabel: UILabel!
    @IBOutlet weak var countOfMissilesLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var reloadMissilesSwitch: UISwitch!
    @IBOutlet weak var reloadOxygenSwitch: UISwitch!
    @IBOutlet weak var missilesOnStartStepper: UIStepper!
    
    
    //MARK: - var/let
    
    
    var imageNum: Int = 1
    var name: String = "none"
    var reloadMissiles: Bool = true
    var reloadOxygen: Bool = true
    var missilesOnStart: Int = 3
    
    
    //MARK: - lifecycleFunc
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else {return}
        imageNum = settings.image
        switch imageNum{
        case 1:
            chooseFirstButton.backgroundColor = .link
        case 2:
            chooseSecondButton.backgroundColor = .link
        case 3:
            chooseThirdButton.backgroundColor = .link
        default:
            chooseFirstButton.backgroundColor = .link
        }
        name = settings.name
        reloadMissiles = settings.reloadMissiles
        reloadOxygen = settings.reloadOxygen
        missilesOnStart = settings.missilesOnStart
        reloadMissilesSwitch.isOn = settings.reloadMissiles
        reloadOxygenSwitch.isOn = settings.reloadOxygen
        missilesOnStartStepper.value = Double(settings.missilesOnStart)
        
        
        textField.text = name
        countOfMissilesLabel.text = String(missilesOnStart)
        
        
        
        //fonts

        youreNameLabel.font = UIFont(name: "UA_Wadim_Giant", size: 25)
        reloadMissilesLabel.font = UIFont(name: "UA_Wadim_Giant", size: 25)
        reloadOxygenLabel.font = UIFont(name: "UA_Wadim_Giant", size: 25)
        missilesOnStartLabel.font = UIFont(name: "UA_Wadim_Giant", size: 25)
        countOfMissilesLabel.font = UIFont(name: "UA_Wadim_Giant", size: 25)
        AboutAuthorButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 17)
        BackButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 17)
    }
    
    override func viewDidLayoutSubviews() {
        chooseFirstButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 17)
        chooseFirstButton.titleLabel?.textColor = .black
        chooseSecondButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 17)
        chooseSecondButton.titleLabel?.textColor = .black
        chooseThirdButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 17)
        chooseThirdButton.titleLabel?.textColor = .black
        AboutAuthorButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 17)
        BackButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 17)
    }
    
    //MARK: - IBActions
    
    @IBAction func toMenuButtonPressed(_ sender: UIButton) {
        name  = textField.text ?? "None"
        
        let settings = Settings(image: imageNum, name: name, reloadMissiles: reloadMissiles, reloadOxygen: reloadOxygen, missilesOnStart: missilesOnStart)
        UserDefaults.standard.set(encodable: settings, forKey: "settings")
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func reloadMissilesSwitch(_ sender: UISwitch) {
        if sender.isOn{
            reloadMissiles = true
        }else{
            reloadMissiles = false
        }
    }
    
    @IBAction func reloadOxygenSwitch(_ sender: UISwitch) {
        if sender.isOn{
            reloadOxygen = true
        }else{
            reloadOxygen = false
        }
    }
    
    @IBAction func MissilesOnStartStepper(_ sender: UIStepper) {
        countOfMissilesLabel.text = Int(sender.value).description
        
        missilesOnStart = Int(sender.value)
    }
    
    @IBAction func chooseFirstButton(_ sender: UIButton) {
        chooseFirstButton.backgroundColor = .link
        chooseSecondButton.backgroundColor = .systemGray5
        chooseThirdButton.backgroundColor = .systemGray5
        imageNum = 1
    }
    
    @IBAction func chooseSecondButton(_ sender: UIButton) {
        chooseFirstButton.backgroundColor = .systemGray5
        chooseSecondButton.backgroundColor = .link
        chooseThirdButton.backgroundColor = .systemGray5
        imageNum = 2
    }
    
    @IBAction func shooseThirdButton(_ sender: UIButton) {
        chooseFirstButton.backgroundColor = .systemGray5
        chooseSecondButton.backgroundColor = .systemGray5
        chooseThirdButton.backgroundColor = .link
        imageNum = 3
    }
    
    
    
    @IBAction func AboutAuthorButtonPressed(_ sender: Any) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "AboutAuthorViewController") as? AboutAuthorViewController else{return}
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    //MARK: - func
    
}


