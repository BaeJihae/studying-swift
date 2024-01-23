//
//  ViewController.swift
//  FloatingButton
//
//  Created by 배지해 on 1/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menu = Menu()
        
        menu.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menu)
        
        menu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        menu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
}

