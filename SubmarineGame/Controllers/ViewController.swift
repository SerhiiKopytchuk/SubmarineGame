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
        
//        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else {return}
        
        welcomeLabel.textColor = .white
        
        welcomeLabel.layer.dropShadow()
        recordButton.layer.dropShadow()
        settingsButton.layer.dropShadow()
        
    }
    
    override func viewDidLayoutSubviews() {
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else {return}
        welcomeLabel.text = "Welcome \(settings.name) !!!"
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
//        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "TableOfRecordsViewController") as? TableOfRecordsViewController else {return}
//        self.navigationController?.pushViewController(controller, animated: true)
        
        presentAlertWithTitle(title: "Sorry, This in't working", message: "We made it in nearly future", options: "Ok") { (option) in
            
        }
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else {return}
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: - extensions

extension CALayer {
    func dropShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

extension UIView{
    func rounded(radius: CGFloat = 15){
        self.layer.cornerRadius = radius
    }
}

extension UIViewController {

    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
}
