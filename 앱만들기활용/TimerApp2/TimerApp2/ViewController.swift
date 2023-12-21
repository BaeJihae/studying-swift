//
//  ViewController.swift
//  TimerApp2
//
//  Created by 배지해 on 12/14/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    var second = 9999
    
    var timer: Timer?
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstpage()
    }
    
    func firstpage() {
        mainLabel.text = "초를 선택하세요."
        slider.setValue(0.5, animated: true)
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        
        // slider의 변화에 따른 값 추출
        second = Int(sender.value * 60)
        mainLabel.text = "\(second)초"
        
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        if second <= 60{
            //초기화
            firstpage()
            audioPlayer?.stop()
            second = 9999
            timer?.invalidate()
            timer = nil
        }
        
    }
    @IBAction func palseButtonTapped(_ sender: UIButton) {
        if second <= 60 {
            timer?.invalidate()
        }
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if second <= 60 {
            // 현재 돌아가고 있는 타이머 초기화
            timer?.invalidate()
            // 1초씩 흐르는 타이머
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changedSecond), userInfo: nil, repeats: true)
        }
    }
    @objc func changedSecond() {
        
        // 소리 파일 경로
        let pathToSound = Bundle.main.path(forResource: "Clock Alarm", ofType: ".mp3")!
        let url = URL(fileURLWithPath: pathToSound)
        
        if second > 0 {
            second -= 1
            mainLabel.text = "\(second)초"
            slider.setValue(Float(second)/60.0, animated: true)
            print(second)
        } else {
            timer?.invalidate()
            timer = nil
            // 소리 나게함.
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            }catch{
                print("소리 파일을 찾을 수 없음.")
            }
            print(second)
        }
        
    }
    
}

