//
//  ViewController.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 02.02.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets
    
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var PlayButton: UIButton!
    
    
    
    
    
    //MARK: - var/let

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsButton.setTitle("settings".localized(), for: .normal)
        recordButton.setTitle("records".localized(), for: .normal)
        PlayButton.setTitle("play".localized(), for: .normal)


        
        welcomeLabel.textColor = .white
        
        welcomeLabel.layer.dropShadow()
        recordButton.layer.dropShadow()
        settingsButton.layer.dropShadow()
        
    }
    
    override func viewDidLayoutSubviews() {
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else {return}
        welcomeLabel.text = "welcome".localized()
        welcomeLabel.text? += " \(settings.name) !!!"
        welcomeLabel.font = UIFont(name: "UA_Wadim_Giant", size: 30)
        PlayButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 50)
        settingsButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 30)
        recordButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 30)
    }
    
    
    

    
    @IBAction func PlayButtonPressed(_ sender: UIButton) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else{return}
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func recordsButtonPressed(_ sender: UIButton) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "TableOfRecordsViewController") as? TableOfRecordsViewController else {return}
        self.navigationController?.pushViewController(controller, animated: true)
        
//        presentAlertWithTitle(title: "Sorry, This in't working", message: "We made it in nearly future", options: "Ok") { (option) in
//        }
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else {return}
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


