//
//  ViewController.swift
//  TableView
//
//  Created by 배지해 on 1/13/24.
//

import UIKit

// TableView를 사용하기 위한 UITableViewDataSource 프로토콜 채택
class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    // 몇 개의 Contents를 표시하는지 알려주는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // TableView의 구체적인 Cell의 형태를 알려주는 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

