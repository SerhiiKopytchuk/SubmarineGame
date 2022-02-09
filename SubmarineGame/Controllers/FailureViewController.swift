//
//  FailureViewController.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 06.02.2022.
//

import UIKit

class FailureViewController: UIViewController {

    @IBOutlet weak var ScoreLabel: UILabel!
    
    var score:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let score = score {
            ScoreLabel.text = score
        }
        
        
    }
    
    
    @IBAction func retryButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
