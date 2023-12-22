//
//  ViewController.swift
//  LoginApp_practice
//
//  Created by 배지해 on 12/22/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 이메일 창
    private lazy var emailTextFieldView: UIView = {
        
        let view = UIView()
        
        // 배경화면 설정
        view.backgroundColor = UIColor.darkGray
        
        // 테두리 모양 둥글게 설정
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        
        view.addSubview(emailInfoLabel)
        view.addSubview(emailTextField)
        
        return view
    }()

    private lazy var emailInfoLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.tintColor = .white
        label.backgroundColor = .clear
        label.text = "이메일주소 또는 전화번호"
        
        
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let tv = UITextField()
        
        tv.backgroundColor = .clear
        tv.textColor = .white
        tv.tintColor = .white
        tv.font = UIFont.systemFont(ofSize: 18)
        tv.autocapitalizationType = .none
        tv.autocorrectionType = .no
        tv.spellCheckingType = .no
        tv.keyboardType = .emailAddress
        
        return tv
    }()
    
    // MARK: - 비밀번호 창
    
    private lazy var passwordTextFieldView: UIView = {
        
        let view = UIView()
        
        // 배경화면 설정
        view.backgroundColor = UIColor.darkGray
        
        // 테두리 모양 둥글게 설정
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordPrivacyButton)
        
        return view
    }()

    private lazy var passwordInfoLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.tintColor = .white
        label.backgroundColor = .clear
        label.text = "비밀번호"
        
        
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tv = UITextField()
        
        tv.frame.size.height = 48
        tv.backgroundColor = .clear
        tv.textColor = .white
        tv.tintColor = .white
        tv.autocapitalizationType = .none
        tv.autocorrectionType = .no
        tv.spellCheckingType = .no
        tv.keyboardType = .default
        
        return tv
    }()
    
    private lazy var passwordPrivacyButton: UIButton = {
        let btn = UIButton(type: .custom)
        
        btn.setTitle("표시", for: .normal)
        btn.backgroundColor = .clear
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        btn.setTitleColor(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), for: .normal)
        
        return btn
    }()
    
    // MARK: - 로그인 버튼
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton(type: .custom)
        
        btn.setTitle("로그인", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 16)
        btn.backgroundColor = .clear
        btn.tintColor = .white
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        btn.isEnabled = false
        
        return btn
    }()
    
    // MARK: - 스택뷰
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ emailTextFieldView, passwordTextFieldView, loginButton])
        
        stack.axis = .vertical
        stack.spacing = 18
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private lazy var passwordResetButton: UIButton = {
        let btn = UIButton()
        
        btn.backgroundColor = .clear
        btn.setTitle("비밀번호 재설정", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print()
        view.backgroundColor = .black
        UIsetting()
    }
    
    private func UIsetting() {
        view.addSubview(stackView)
        view.addSubview(passwordResetButton)
        
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordPrivacyButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
            emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor),
            
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -2),
            
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
            
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -2),
            
        
            passwordPrivacyButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            passwordPrivacyButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordPrivacyButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: 180),
            
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
}

