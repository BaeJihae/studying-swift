//
//  ViewController.swift
//  UpDownApp
//
//  Created by 배지해 on 2023/06/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var numberLable: UILabel!
    
    var comSelectNum = Int.random(in: 1...10)
    
    // 앱을 실행했을 때 바로 보이는 화면
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainLable.text = "선택하세요."
        numberLable.text = ""
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let numString = sender.currentTitle else { return }
        
        numberLable.text = numString
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        guard let numStr = numberLable.text else { return }
        guard let numInt = Int(numStr) else { return }
        
        if numInt < comSelectNum {
            mainLable.text = "UP!"
        }else if numInt > comSelectNum{
            mainLable.text = "DOWN!"
        }else{
            mainLable.text = "BINGO!💗"
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLable.text = "선택하세요."
        numberLable.text = ""
        comSelectNum = Int.random(in:1...10)
        
    }
    
}

