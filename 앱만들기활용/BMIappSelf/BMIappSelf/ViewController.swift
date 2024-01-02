//
//  ViewController.swift
//  BMIappSelf
//
//  Created by 배지해 on 1/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var bmiCalculateButton: UIButton!
    
    // bmi를 담을 전역 변수 만들기
    var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSetting()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        
    }
    
    func uiSetting() {
        
        // mainLabel 초기 설정
        mainLabel.text = "키와 몸무게를 입력해 주세요."
        
        // BMI 계산하기 버튼 테두리 둥글게 만들기
        bmiCalculateButton.translatesAutoresizingMaskIntoConstraints = true
        bmiCalculateButton.layer.cornerRadius = 5
        
        // heightTF의 placeholder 설정
        heightTextField.placeholder = "키를 입력해주세요."
        // heightTF의 키보드 타입 설정
        heightTextField.keyboardType = .numbersAndPunctuation
        // hegithTF 테두리 둥글게 만들기
        heightTextField.translatesAutoresizingMaskIntoConstraints = true
        heightTextField.layer.cornerRadius = 8
        
        // weightTF의 placeholder 설정
        weightTextField.placeholder = "몸무게를 입력해주세요."
        // weightTF의 키보드 타입 설정
        weightTextField.keyboardType = .numbersAndPunctuation
        // weightTF 테두리 둥글게 만들기
        weightTextField.translatesAutoresizingMaskIntoConstraints = true
        weightTextField.layer.cornerRadius = 8
    }

    @IBAction func bmiCalculateButtonTapped(_ sender: UIButton) {
        // BMI 결과
        guard let weight = weightTextField.text, let height = heightTextField.text else { return }
        bmi = bmiCalculate( weight, height)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if weightTextField.text == "", heightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야만 합니다!"
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해 주세요."
        mainLabel.textColor = .black
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            // secondVC에 접근하기 위해서는 Destination이라는 segue의 목적지를 SecondViewController로 타입 캐스팅해야한다.
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.bmiResultValue = bmi
            secondVC.bmiColor = getBackgroundColorAdviceString().0
            secondVC.bmiAdvice = getBackgroundColorAdviceString().1
            
        }
        weightTextField.text = ""
        heightTextField.text = ""
    }
    
    func bmiCalculate(_ weight: String, _ height: String) -> Double{
        guard let w = Double(weight), let h = Double(height) else { return 0.0 }
        return round( w / ( h * h ) * 10000 * 10 ) / 10
    }
    
    // BMI의 계산값에 따른 색깔과 수치 출력하는 함수
    func getBackgroundColorAdviceString() -> ( UIColor, String ) {
        guard let bmi = bmi else { return (UIColor.black, "오류") }
        switch bmi {
        case ..<18.6:
            return ( UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1), "저체중")
        case 18.6..<23.0:
            return (UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1), "표준")
        case 23.0..<25.0:
            return (UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1), "과체중")
        case 25.0..<30.0:
            return (UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1), "중도비만")
        case 30.0...:
            return (UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1), "고도비만")
        default:
            return (UIColor.black, "오류")
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    // TF의 숫자 사용만을 허락
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    // Return 버튼 허락 여부
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if weightTextField.text != "" && heightTextField.text != ""{
            // weightTF 키보드 내리기
            weightTextField.resignFirstResponder()
            return true
        }else if heightTextField.text != ""{
            // weightTF로 이동하여 키보드 올리기
            weightTextField.becomeFirstResponder()
            return true
        }else {
            return false
        }
    }
    // 빈 화면을 클릭할 시 TF종료
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // heightTF 키보드 내리기
        heightTextField.resignFirstResponder()
        // weightTF 키보드 내리기
        weightTextField.resignFirstResponder()
    }
}
