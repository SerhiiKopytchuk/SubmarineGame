//
//  SettingsViewController.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 02.02.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var AboutAuthorButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        AboutAuthorButton.layer.dropShadow()
        AboutAuthorButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 17)
        BackButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 17)
    }
    override func viewDidLayoutSubviews() {
        AboutAuthorButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 17)
        BackButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 17)
    }
    
    
    @IBAction func toMenuButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func AboutAuthorButtonPressed(_ sender: Any) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "AboutAuthorViewController") as? AboutAuthorViewController else{return}
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
