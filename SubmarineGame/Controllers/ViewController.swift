//
//  ViewController.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 02.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func PlayButtonPressed(_ sender: UIButton) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else{return}
        self.navigationController?.pushViewController(controller, animated: true)
    }

    @IBAction func recordsButtonPressed(_ sender: UIButton) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "TableOfRecordsViewController") as? TableOfRecordsViewController else {return}
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else {return}
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

