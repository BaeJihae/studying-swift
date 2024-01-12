//
//  AnchorViewController.swift
//  autoLayoutwithCode
//
//  Created by 배지해 on 1/13/24.
//

import UIKit

class AnchorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        
        view.addSubview(button)
                        
        let safeArea = view.safeAreaLayoutGuide
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        
        let safeBottomAnchor = button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        
        safeBottomAnchor.isActive = true
        safeBottomAnchor.priority = .init(999)
        
        let viewBottomAnchor = button.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        viewBottomAnchor.isActive = true
    }
    

}
