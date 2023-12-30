//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        
        firstVC.someString = "안녕하세요"
        
        firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: true, completion: nil)
        
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
            secondVC.someString = "안녕하세요"
            present(secondVC, animated: true, completion: nil)
        }
        
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toThirdVC", sender: self)
    }
    
    // 세그웨이 방식은 다른 재정의된 함수로 문자열 전달
    // UIStoryboardSegue라는 클래스를 통해서 다음 화면에 접근이 가능함.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            
            let thirdVC = segue.destination as! ThirdViewController
            thirdVC.someString = "세번째 페이지 완성!"
        }
        
        if segue.identifier == "toFourVC" {
            
            let FourVC = segue.destination as! FourthViewController
            FourVC.someString = "네번째 페이지 완성!"
        }
    }

    
}
