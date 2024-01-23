//
//  DynamicViewController.swift
//  autoLayoutwithCode
//
//  Created by 배지해 on 1/18/24.
//

import UIKit

class DynamicViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var buttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(adjustButtonDynamicType), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    @objc func adjustButtonDynamicType() {
        buttons.forEach{ $0.titleLabel?.adjustsFontForContentSizeCategory = true }
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let label = UILabel()
        label.text = "안녕하세요 저는 지해입니다."
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.layoutMargins = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        label.numberOfLines = 0
        label.backgroundColor = .systemBlue
        label.isHidden = true
        label.textColor = .white
        label.adjustsFontForContentSizeCategory = true
        stackView.addArrangedSubview(label)
        
        UIView.animate(withDuration: 0.3) {
            label.isHidden = false
        }
    }
    
    @IBAction func removeButton(_ sender: UIButton) {
        guard let last = stackView.arrangedSubviews.last else {return}
         
        UIView.animate(withDuration: 0.3) {
            last.isHidden = true
        }completion: { _ in
            self.stackView.removeArrangedSubview(last)
        }
    }
}


