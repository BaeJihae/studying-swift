//
//  FirstViewController.swift
//  NextVC
//
//  Created by 배지해 on 12/29/23.
//

import UIKit

class FirstViewController: UIViewController {
    
    // 문자열을 전달 받기 위한 변수 -> 일반적으로 옵셔널로 선언 ( 생성자가 없어도 됨 )
    var someString: String?
    
    let mainLabel = UILabel()
    
    let backButton: UIButton = {
        let btn = UIButton(type: .custom)
        
        btn.setTitle("Back", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.blue
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        // 버튼 눌렀을 때, 이전 화면으로 넘어가도록 동작
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        return btn
    }()
    
    
    @objc func backButtonTapped() {
        // 이전 화면으로 화면 전환
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configureUI()
    }
    
    
    func setup() {
        mainLabel.text = someString
        mainLabel.font = UIFont.systemFont(ofSize: 22)
        
        view.addSubview(mainLabel)
        view.addSubview(backButton)
        
        view.backgroundColor = .gray
    }
    
    
    func configureUI() {
        
        view.backgroundColor = .gray
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
}
