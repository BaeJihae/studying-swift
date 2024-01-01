//
//  SecondViewController.swift
//  BMIapp
//
//  Created by 배지해 on 12/31/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var bmi: Double?
    var bmiColor: UIColor?
    var advice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        // bmi 데이터 출력
        guard let bmi = bmi else { return }
        bmiNumberLabel.text = String(bmi)
        
        // bmiNumberLabel 배경 설정
        bmiNumberLabel.backgroundColor = bmiColor
        
        // adviceLable 출력
        adviceLabel.text = advice
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
