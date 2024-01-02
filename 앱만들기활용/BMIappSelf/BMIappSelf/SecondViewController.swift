//
//  SecondViewController.swift
//  BMIappSelf
//
//  Created by 배지해 on 1/2/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var bmiResultValueLabel: UILabel!
    @IBOutlet weak var bmiCaculateViewLabel: UILabel!
    @IBOutlet weak var bmiAdviceLabel: UILabel!
    @IBOutlet weak var bmiResetButton: UIButton!
    
    var bmiResultValue: Double?
    var bmiAdvice: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSetting()
    }
    
    func uiSetting() {
        
        // bmi 계산결과를 보여주는 라벨 테두리 둥글게 만들기
        bmiCaculateViewLabel.translatesAutoresizingMaskIntoConstraints = true
        bmiCaculateViewLabel.layer.cornerRadius = 3
        
        // bmi Reset 버튼 테두리 둥글게 만들기
        bmiResetButton.translatesAutoresizingMaskIntoConstraints = true
        bmiResetButton.layer.cornerRadius = 5
        
        // bmi 데이터 출력
        guard let bmi = bmiResultValue else { return }
        bmiCaculateViewLabel.text = String(bmi)
        
        // bmi advice 문자열 출력
        bmiAdviceLabel.text = bmiAdvice
        
        // bmi 배경 color 출력
        bmiCaculateViewLabel.backgroundColor = bmiColor
    }
    
    @IBAction func bmiResetButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
