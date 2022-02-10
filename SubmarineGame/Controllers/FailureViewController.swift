//
//  FailureViewController.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 06.02.2022.
//

import UIKit

class FailureViewController: UIViewController {

    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var gameOverLabel: UILabel!
    
    var score:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let score = score {
            ScoreLabel.text = score
        }
    }
    
    override func viewDidLayoutSubviews() {
        ScoreLabel.font = UIFont(name: "UA_Wadim_Giant", size: 35)
        gameOverLabel.font = UIFont(name: "UA_Wadim_Giant", size: 50)
        retryButton.titleLabel?.font = UIFont(name: "UA_Wadim_Giant", size: 30)
        retryButton.titleLabel?.textColor = UIColor.black
    }
    
    @IBAction func retryButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
