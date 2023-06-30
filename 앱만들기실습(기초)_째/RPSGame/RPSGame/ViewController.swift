//
//  ViewController.swift
//  RPSGame
//
//  Created by 배지해 on 2023/06/06.
//

import UIKit

class ViewController: UIViewController {

    // 변수, 속성..
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    var myChoice: Rps = Rps.Rock
    
    
    // 함수, 메서드..
    // 앱을 실행하여 처음 출력되는 화면
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // 첫번째, 두번째 이미지뷰에 준비(묵) 이미지를 띄어야 함.
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready")
        
        // 첫번째, 두번째 레이블에 "준비" 문자열을 띄어야 함.
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        
    }
    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        
        // 가위/바위/보 를 선택해서 그 정보를 저장해야함.
        
        let title = sender.currentTitle!
  
        switch title {
        case "바위":
            myChoice = Rps.Rock
        case "보":
            myChoice = Rps.Paper
        case "가위":
            myChoice = Rps.Scissors
        default:
            break
        }
        
    }
    

    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        
        // 1) 컴퓨터가 랜덤으로 선택한 가위/바위/보 이미지를 이미지뷰에 띄어야 함.
        // 2) 컴퓨터가 랜덤으로 선택한 가위/바위/보 문자열을 레이블에 띄어야함.
        switch comChoice {
        case Rps.Rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.Paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case Rps.Scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        
        // 3) 내가 선택한 가위/바위/보 이미지를 이미지뷰에 띄어야 함.
        // 4) 내가 선택한 가위/바위/보 문자열을 레이블에 띄어야함.
        switch myChoice {
        case Rps.Rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case Rps.Paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case Rps.Scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        
        // 5) 컴퓨터와 나의 선택을 비교하여 승부를 가려야함.
        // 6) 가린 승부를 메인 레이블에 띄어야 함.
        if comChoice == myChoice {
            mainLabel.text = "비겼다"
        }else if comChoice == .Paper && myChoice == .Scissors {
            mainLabel.text = "이겼다"
        }else if comChoice == .Rock && myChoice == .Paper {
            mainLabel.text = "이겼다"
        }else if comChoice == .Scissors && myChoice == .Rock {
            mainLabel.text = "이겼다"
        }else{
            mainLabel.text = "졌다"
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터의 이미지뷰를 처음으로 리셋
        // 2) 컴퓨터의 레이블을 처음으로 리셋
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
        
        // 3) 나의 이미지뷰를 처음으로 리셋
        // 4) 나의 레이블을 처음으로 리셋
        myImageView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "준비"
        
        // 5) 컴퓨터의 랜덤 선택을 리셋
        mainLabel.text = "선택하세요"
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
    }
    
    
    
}

