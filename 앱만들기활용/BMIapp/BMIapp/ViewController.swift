//
//  ViewController.swift
//  BMIapp
//
//  Created by 배지해 on 12/30/23.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI(){
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력해 주세요."
        
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        
        heightTextField.placeholder = "cm단위로 입력해주세요."
        
        weightTextField.placeholder = "kg단위로 입력해주세요."
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        
        
        
    }
    
}

// TF를 위한 델리게이트 프로토콜 채택
extension ViewController: UITextFieldDelegate{
    
}
