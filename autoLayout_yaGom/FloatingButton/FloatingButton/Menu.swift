//
//  Menu.swift
//  FloatingButton
//
//  Created by 배지해 on 1/23/24.
//

import UIKit

class Menu: UIView {
    
    private var menubutton = UIButton()
    private var menustack = UIStackView()
    
    // 새로운 view의 생성자
    override init(frame: CGRect) {
        super.init(frame: frame)
        menuButton()
        menuStack()
    }
    
    // 필수 생성자
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Menu {
    
    // menuButton 생성하기
    private func menuButton() {
        
        let button = UIButton(type: .system)
        let menuButtonImage = UIImage(systemName: "tray",
                                      withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle))
        
        button.setImage(menuButtonImage, for: .normal)
        button.tintColor = .blue
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(button)
        
        let buttonTopConstraint = button.topAnchor.constraint(equalTo: topAnchor)
        buttonTopConstraint.priority = .defaultLow
        buttonTopConstraint.isActive = true
        
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        button.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        
        menubutton = button
    }
    
    // menuStack 생성하기
    private func menuStack() {
        
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonImageNames = [ "pencil", "person.fill", "photo", "bubble.left.and.button.right" ]
        
        buttonImageNames.forEach{ buttonImage in
            
            let button = UIButton(type: .system)
            let buttonImage = UIImage(systemName: buttonImage,
                                          withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle))
            
            button.setImage(buttonImage, for: .normal)
            button.isHidden = true
            button.tintColor = .brown
            
            stack.addArrangedSubview(button)
        }
        
        addSubview(stack)
        
        let stackTopConstraint = stack.topAnchor.constraint(equalTo: topAnchor)
        stackTopConstraint.priority = .defaultHigh
        stackTopConstraint.isActive = true
        
        stack.bottomAnchor.constraint(equalTo: menubutton.topAnchor).isActive = true
        stack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        menustack = stack
    }
    
    // stackView 나타나기
    @objc private func menuButtonTapped() {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5) {
            self.menustack.arrangedSubviews.forEach { button in
                button.isHidden = !button.isHidden
            }
            
            self.menustack.layoutIfNeeded()
        }
    }
    
}



