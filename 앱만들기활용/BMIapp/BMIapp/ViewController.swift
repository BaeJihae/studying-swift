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
    
    // 버튼 클릭시 다음 화면으로의 전환 여부
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if weightTextField.text == "", weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야만 합니다!"
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        mainLabel.textColor = .black
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}

// TF를 위한 델리게이트 프로토콜 채택
extension ViewController: UITextFieldDelegate{
    
    // TF에서의 입력 제어
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 숫자이고, 빈 문자열이라면 입력 허용 -> height와 weight 모두 적용
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    // Return 버튼 허락 여부
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두 개의 텍스트 필드를 모두 종료 ( 키보드를 내린다 )
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        // 두번째 텍스트 필드로 넘어가도록
        }else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    // 빈 화면을 클릭할 시 TF종료
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 키보드 내리기
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}
