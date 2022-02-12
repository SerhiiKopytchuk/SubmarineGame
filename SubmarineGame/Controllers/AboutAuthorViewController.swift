//
//  AboutAuthorViewController.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 12.02.2022.
//

import UIKit

class AboutAuthorViewController: UIViewController {

    //MARK: - IBoutlets
    @IBOutlet weak var litekochImageView: UIImageView!
    @IBOutlet weak var aboutAuthorLabel: UILabel!
    @IBOutlet weak var backButoon: UIButton!
    
    //MARK: - let/var
    
    
    //MARK: - lifecycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButoon.layer.dropShadow()
        
        aboutAuthorLabel.text = "The student of Kyiv Politech Institute Kopytchuk Serhii"
        aboutAuthorLabel.font = UIFont(name: "UA_Wadim_Giant", size: 60)
        
        backButoon.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 30)
    }
    
    //MARK: - IBActions
    
    @IBAction func BackButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - func
    


}
