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
    
    var bmi: Double?
    
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
        heightTextField.keyboardType = .numbersAndPunctuation
        
        weightTextField.placeholder = "kg단위로 입력해주세요."
        weightTextField.keyboardType = .numbersAndPunctuation
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        // Bmi 결과값을 뽑아냄.
        guard let height = heightTextField.text, let weight = weightTextField.text else { return }
        bmi = caculateBMI(height: height, weight: weight)
        
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
        return true
    }
    
    // 다음 화면으로 데이터 전달을 위한 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecond" {
            let secondVC = segue.destination as! SecondViewController
            // 계산된 결과값을 다음 화면으로 전달
            secondVC.bmi = self.bmi
            secondVC.bmiColor = getBackgroundColorAndString().0
            secondVC.advice = getBackgroundColorAndString().1
        }
        
        // 다음 화면으로 넘어가기 TF 비우기
        heightTextField.text = ""
        weightTextField.text = ""
        
    }
    
    // BMI 계산 메서드
    func caculateBMI(height: String, weight: String) -> Double {
        guard let h = Double(height), let w = Double(weight) else { return 0.0 }
        var bmi = w / ( h * h ) * 10000
        print("BMI결과값(반올림하기전):\(bmi)")
        bmi = round( bmi * 10 ) / 10
        print("BMI결과값(반올림한 후):\(bmi)")
        return bmi
    }
    
    // 색깔과 문자열 얻는 메서드
    func getBackgroundColorAndString() -> ( UIColor, String ) {
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
