//
//  ViewController.swift
//  TimerApp
//
//  Created by 배지해 on 12/12/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // 메인 라벨
    @IBOutlet weak var mainLabel: UILabel!
    
    // 초를 정할 수 있는 슬라이더
    @IBOutlet weak var uiSlider: UISlider!
    
    var timer = Timer()
    
    // 사용자가 설정한 시간
    var currentTimerSecond: Int = 0
    
    func resetText() {
        mainLabel.text = "초를 선택하세요."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        resetText()
        
        // 슬라이더 가운데 정렬
        uiSlider.value = 0.5
    }
    
    @IBAction func tappedUiSlider(_ sender: UISlider) {
        
        // uiSlider를 옮길 때, 사용자가 설정한 초가 변경되어야 함.
        currentTimerSecond = Int(uiSlider.value * 60)
        mainLabel.text = "\(currentTimerSecond)초"
        
    }

    // start 버튼을 눌렀을 때의 동작
    @IBAction func tappedStartButton(_ sender: UIButton) {
        
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
            if currentTimerSecond > 0 {
                
                // 1초에 1씩 초 줄이기
                currentTimerSecond -= 1
                
                // mainLabel에 줄어드는 초 띄우기
                mainLabel.text = "\(currentTimerSecond)초"
                
                // 초가 줄어들 때마다 slider 줄어들기
                uiSlider.setValue(Float(currentTimerSecond)/60.0, animated: true)
                
            } else {
                timer.invalidate()
                currentTimerSecond = 0
                
                // 소리 울리기
                AudioServicesPropertyID(SystemSoundID(1322))
                
                
            }
        })
    
    }
    
    // reset 버튼을 눌렀을 때의 동작
    @IBAction func tappedResetButton(_ sender: UIButton) {
        
        // 초기화
        resetText()
        
        // 슬라이더 가운데 정렬
        uiSlider.setValue( 0.5, animated: true)
    
    }
}

