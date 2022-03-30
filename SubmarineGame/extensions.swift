//
//  extensions.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 12.02.2022.
//

import Foundation
import UIKit

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

extension UIView {
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

extension UserDefaults{
    // extension that allow us to save our objects
    func set<T: Encodable>(encodable: T, forKey key: String){
        if let data = try? JSONEncoder().encode(encodable){
            set(data, forKey: key)
        }
    }
    
    func value<T: Decodable>(_ type: T.Type, forKey key: String) ->T?{
        if let data = object(forKey: key) as? Data,
           let value = try? JSONDecoder().decode(type, from: data){
            return value
        }
        return nil
    }
}

extension String{
    func localized() -> String{
        return NSLocalizedString(self, comment: "")
    }
}
