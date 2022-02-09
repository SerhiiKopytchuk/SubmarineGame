//
//  SettingsViewController.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 02.02.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func toMenuButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }


}
