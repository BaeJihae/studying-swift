//
//  ViewController.swift
//  Self-SizingTableViewCells
//
//  Created by 배지해 on 1/24/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter
            .default
            .addObserver(forName: NSNotification.Name("layoutCell"),
                         object: nil,
                         queue: OperationQueue.main) { noti in
                self.tableView.beginUpdates()
                self.tableView.endUpdates()
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let customCell = cell as? CustomTableViewCell else {
            return cell
        }
        
        customCell.titleLabel?.text = indexPath.description
        customCell.postLabel.text = """
            안녕하세요리다ㅙㅑㄴ어ㅣ라ㅓㄴ대ㅑ러니아러ㅑㅐㄴ더리ㅏㄴ
            레
            레
            레
            레
            레
            ㅌ레
            레
            레
            레
            레
        """
        
        customCell.myIamgeView?.image = UIImage(named: "\(indexPath.row % 10)")
        
        return customCell
    }
}

