//
//  TableOfRecordsViewController.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 02.02.2022.
//

import UIKit

class TableOfRecordsViewController: UIViewController {
    @IBOutlet weak var scoreTableView: UITableView!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "score".localized()
        nameLabel.text = "name".localized()
        backButton.titleLabel?.text = "back".localized()
        
    }
    
    @IBAction func toMenuButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    

}

extension TableOfRecordsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let resultsArray = UserDefaults.standard.value([Result].self, forKey: "resultArray") ?? [Result]()
        
        return resultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecordTableViewCell", for: indexPath) as? RecordTableViewCell else {return UITableViewCell()}
        let resultsArray = UserDefaults.standard.value([Result].self, forKey: "resultArray") ?? [Result]()
            
        cell.configuratioin(name: resultsArray[indexPath.row].name, score: String(resultsArray[indexPath.row].score) )
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
