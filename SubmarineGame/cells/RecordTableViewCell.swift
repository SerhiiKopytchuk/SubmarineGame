//
//  RecordTableViewCell.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 13.03.2022.
//

import UIKit

class RecordTableViewCell: UITableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configuratioin(name:String, score:String){
        NameLabel.text = name
        scoreLabel.text = score
    }
    
}
