//
//  GameViewController.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 02.02.2022.
//

import UIKit

class GameViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var submarineImageView: UIView!
    @IBOutlet weak var sharkImageView: UIImageView!
    @IBOutlet weak var sharkImageSecondView: UIImageView!
    @IBOutlet weak var sharkImageThirdView: UIImageView!
    @IBOutlet weak var sharkImageForthView: UIImageView!
    @IBOutlet weak var boatImageView: UIImageView!
    @IBOutlet weak var upButtonView: UIImageView!
    @IBOutlet weak var downButtonView: UIImageView!
    @IBOutlet weak var ryphFirstImageView: UIImageView!
    @IBOutlet weak var ryphSecondImageView: UIImageView!
    @IBOutlet weak var waterFirstImageView: UIImageView!
    @IBOutlet weak var waterSecondImageView: UIImageView!
    @IBOutlet weak var oxygenView: UIView!
    @IBOutlet weak var airBalloonImageView: UIImageView!
    
    
    
    //MARK: - var/let
    
    var screenWidth = CGFloat(UIScreen.main.fixedCoordinateSpace.bounds.width)
    var screenHeight = CGFloat(UIScreen.main.fixedCoordinateSpace.bounds.height)
    var oxygen = Double(100)
    var loose = false
    
    
    
    //MARK: - lifecycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //button up recognizer
        let upTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(upButtonPressed(_:)))
        upButtonView.isUserInteractionEnabled = true
        upButtonView.addGestureRecognizer(upTapRecognizer)
        
        //button down recognizer
        let downTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(downButtonPressed(_:)))
        downButtonView.isUserInteractionEnabled = true
        downButtonView.addGestureRecognizer(downTapRecognizer)
        
        downButtonView.layer.dropShadow()
        upButtonView.layer.dropShadow()
        
        
        startGame()
        moveRyph()
        moveWater()
        oxygenCheck()
        score()
        moveAirBallon()
        oxygenToFull()
        endGame()
    }
    
    //MARK: - IBActions
    
    @IBAction func toMenuButtonpressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func upButtonPressed(_ sender: UIButton) {
        if self.submarineImageView.frame.origin.y > 50{
            UIView.animate(withDuration: 0.2) {
                self.submarineImageView.frame.origin.y -= 30
            }
        }
    }
    
    
        

    @IBAction func downButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.submarineImageView.frame.origin.y += 30
        }
    }
    
    
    //MARK: - func
    
    
    
    
    func startGame(){
        sharkImageView.frame.origin.x  = screenHeight
        sharkImageSecondView.frame.origin.x  = screenHeight
        sharkImageThirdView.frame.origin.x  = screenHeight
        sharkImageForthView.frame.origin.x  = screenHeight
        airBalloonImageView.frame.origin.x  = screenHeight
        boatImageView.frame.origin.x  = screenHeight
        
        
        
        self.moveBoat()
        self.moveSharkSecond()
        self.moveShark()
        self.moveSharkThird()
        self.moveSharkForth()
    }
    
    
    func moveAirBallon(){
        self.airBalloonImageView.frame.origin.y = CGFloat.random(in: 100...self.screenWidth-50)
        let _ = Timer.scheduledTimer(withTimeInterval: TimeInterval(Int.random(in: 30...55)), repeats: false) { _ in
            let _ = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { _ in
                UIView.animate(withDuration: 0.05, delay: 0.0, options: [.curveLinear]) {
                    self.airBalloonImageView.frame.origin.x -= 10
                } completion: { _ in
                }
                if self.airBalloonImageView.frame.origin.x < -200{
                    self.airBalloonImageView.frame.origin.y = CGFloat.random(in: 150...self.screenWidth-100)
                    self.airBalloonImageView.frame.origin.x = self.screenHeight + CGFloat.random(in: 3000...4000)
                }
            })
        }
    }

    
    
    func moveShark(){
        self.sharkImageView.frame.origin.y = CGFloat.random(in: 100...self.screenWidth-50)
        let _ = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { _ in
            UIView.animate(withDuration: 0.05, delay: 0.0, options: [.curveLinear]) {
                self.sharkImageView.frame.origin.x -= 11
            } completion: { _ in
            }
            if self.sharkImageView.frame.origin.x < CGFloat.random(in: -200...0){
                self.sharkImageView.frame.origin.y = CGFloat.random(in: 100...self.screenWidth-50)
                self.sharkImageView.frame.origin.x = self.screenHeight + CGFloat.random(in: 0...50)
            }
        })
    }

    func moveSharkSecond(){
        self.sharkImageSecondView.frame.origin.y = CGFloat.random(in: 100...self.screenWidth-150)
        _ = Timer.scheduledTimer(withTimeInterval: TimeInterval(Int32.random(in: 4...8)), repeats: false, block: { _ in
            let _ = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { _ in
                UIView.animate(withDuration: 0.05, delay: 0.0, options: [.curveLinear]) {
                    self.sharkImageSecondView.frame.origin.x -= 13
                } completion: { _ in
                }
                if self.sharkImageSecondView.frame.origin.x < CGFloat.random(in: -200...0){
                    self.sharkImageSecondView.frame.origin.y = CGFloat.random(in: 100...self.screenWidth-50)
                    self.sharkImageSecondView.frame.origin.x = self.screenHeight + CGFloat.random(in: 0...50)
                }
            })
        })
    }
    
    func moveSharkThird(){
        self.sharkImageThirdView.frame.origin.y = CGFloat.random(in: 100...self.screenWidth-150)
        _ = Timer.scheduledTimer(withTimeInterval: TimeInterval(Int32.random(in: 8...16)), repeats: false, block: { _ in
            let _ = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { _ in
                UIView.animate(withDuration: 0.05, delay: 0.0, options: [.curveLinear]) {
                    self.sharkImageThirdView.frame.origin.x -= 15
                } completion: { _ in
                }
                if self.sharkImageThirdView.frame.origin.x < CGFloat.random(in: -200...0){
                    self.sharkImageThirdView.frame.origin.y = CGFloat.random(in: 100...self.screenWidth-50)
                    self.sharkImageThirdView.frame.origin.x = self.screenHeight + CGFloat.random(in: 0...50)
                }
            })
        })
    }
    
    func moveSharkForth(){
        self.sharkImageForthView.frame.origin.y = CGFloat.random(in: 100...self.screenWidth-150)
        _ = Timer.scheduledTimer(withTimeInterval: TimeInterval(Int32.random(in: 1...30)), repeats: false, block: { _ in
            let _ = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { _ in
                UIView.animate(withDuration: 0.05, delay: 0.0, options: [.curveLinear]) {
                    self.sharkImageForthView.frame.origin.x -= 20
                } completion: { _ in
                }
                if self.sharkImageForthView.frame.origin.x < CGFloat.random(in: -200...0){
                    self.sharkImageForthView.frame.origin.y = CGFloat.random(in: 100...self.screenWidth-50)
                    self.sharkImageForthView.frame.origin.x = self.screenHeight + CGFloat.random(in: 0...50)
                }
            })
        })
    }
    
    
    func moveBoat(){
         _ = Timer.scheduledTimer(withTimeInterval: 5 , repeats: false, block: { _ in
            let _ = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
                UIView.animate(withDuration: 0.01, delay: 0.0, options: [.curveLinear]) {
                    self.boatImageView.frame.origin.x -= 2
                } completion: { _ in}
            })
            _ = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: { _ in
                if self.boatImageView.frame.origin.x < -100 - CGFloat.random(in: 0...300){
                    self.boatImageView.frame.origin.x = self.screenHeight
                }
            })
        })
    }
    
    func moveRyph(){
        ryphSecondImageView.frame.origin.y = ryphFirstImageView.frame.origin.y
        ryphSecondImageView.frame.origin.x = screenHeight
        let firstPos = self.ryphFirstImageView.frame.origin.x
    
        let ryphWidth = -self.ryphFirstImageView.frame.width
        UIView.animate(withDuration: 5, delay: 0.0, options: [.repeat, .curveLinear]) {
            self.ryphSecondImageView.frame.origin.x = self.ryphFirstImageView.frame.origin.x
        }
        UIView.animate(withDuration: 5, delay: 0.0, options: [.repeat, .curveLinear]) {
            self.ryphFirstImageView.frame.origin.x = firstPos + ryphWidth
        }
    }
    
    func moveWater(){
        waterSecondImageView.frame.origin.y = waterFirstImageView.frame.origin.y
        waterSecondImageView.frame.origin.x = screenHeight
        let firstPos = self.waterFirstImageView.frame.origin.x
    
        let ryphWidth = -self.waterSecondImageView.frame.width
        UIView.animate(withDuration: 5, delay: 0.0, options: [.repeat, .curveLinear]) {
            self.waterSecondImageView.frame.origin.x = self.waterFirstImageView.frame.origin.x
        }
        UIView.animate(withDuration: 5, delay: 0.0, options: [.repeat, .curveLinear]) {
            self.waterFirstImageView.frame.origin.x = firstPos + ryphWidth
        }
    }
    
    
    func endGame(){
        let controller = navigationController?.storyboard?.instantiateViewController(withIdentifier: "FailureViewController") as! FailureViewController
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {  _ in
            if self.submarineImageView.frame.origin.y > self.screenWidth - 2 * self.ryphFirstImageView.frame.height && self.loose == false{
                self.loose = true
                controller.score = self.ScoreLabel.text
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
            if self.submarineImageView.frame.intersects(self.sharkImageView.frame) && self.loose == false{
                self.loose = true
                self.sharkImageView.frame.origin.x = 0
                controller.score = self.ScoreLabel.text
                self.navigationController?.pushViewController(controller, animated: true)
            }
            if self.submarineImageView.frame.intersects(self.sharkImageSecondView.frame) && self.loose == false {
                self.loose = true
                self.sharkImageSecondView.frame.origin.x = 0
                controller.score = self.ScoreLabel.text
                self.navigationController?.pushViewController(controller, animated: true)
            }
            if self.submarineImageView.frame.intersects(self.sharkImageThirdView.frame) && self.loose == false {
                self.loose = true
                self.sharkImageThirdView.frame.origin.x = 0
                controller.score = self.ScoreLabel.text
                self.navigationController?.pushViewController(controller, animated: true)
            }
            if self.submarineImageView.frame.intersects(self.sharkImageForthView.frame) && self.loose == false {
                self.loose = true
                self.sharkImageForthView.frame.origin.x = 0
                controller.score = self.ScoreLabel.text
                self.navigationController?.pushViewController(controller, animated: true)
            }
            if self.submarineImageView.frame.intersects(self.boatImageView.frame) && self.loose == false {
                self.loose = true
                self.boatImageView.frame.origin.x = 0
                controller.score = self.ScoreLabel.text
                self.navigationController?.pushViewController(controller, animated: true)
            }
            if self.oxygen <= 0 && self.loose == false {
                self.loose = true
                self.boatImageView.frame.origin.x = 0
                controller.score = self.ScoreLabel.text
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
    
    
    func score(){
        ScoreLabel.text = "Score: 0"
        var score = 0
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            score += 1
            self.ScoreLabel.text = "Score: \(score)"
        }
    }
    
    func oxygenToFull(){
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            if self.submarineImageView.frame.intersects(self.airBalloonImageView.frame){
                self.oxygen = 100
                self.airBalloonImageView.frame.origin.x = CGFloat.random(in: 3000...4000)
            }
        })
    }
    
    func oxygenCheck() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            if self.submarineImageView.frame.origin.y <= 50{
                if self.oxygen > 100{
                    self.oxygen = 100
                }else{
                self.oxygen += 2
                
                }
            }else{
                self.oxygen -= 0.7
            }
        })
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.curveLinear, .repeat]) {
                self.oxygenView.frame.origin.y = self.screenWidth - self.screenWidth/100 * self.oxygen
            } completion: { _ in
                
            }

        })
    }
}

//MARK: - extensions


//extension CALayer {
//  func dropShadow1(
//    color: UIColor = .black,
//    alpha: Float = 0.5,
//    x: CGFloat = 0,
//    y: CGFloat = 2,
//    blur: CGFloat = 4,
//    spread: CGFloat = 0)
//  {
//    masksToBounds = false
//    shadowColor = color.cgColor
//    shadowOpacity = alpha
//    shadowOffset = CGSize(width: x, height: y)
//    shadowRadius = blur / 2.0
//    if spread == 0 {
//      shadowPath = nil
//    } else {
//      let dx = -spread
//      let rect = bounds.insetBy(dx: dx, dy: dx)
//      shadowPath = UIBezierPath(rect: rect).cgPath
//    }
//  }
//}
