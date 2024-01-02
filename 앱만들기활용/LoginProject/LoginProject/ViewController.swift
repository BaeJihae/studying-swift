//
//  ViewController.swift
//  LoginProject
//
//  Created by 배지해 on 12/19/23.
//

import UIKit

// final은 더이상 상속을 하지 못하게 만드는 키워드
// viewController에는 꼭 final 붙여야함.
final class ViewController: UIViewController {
    
    private let loginView = LoginView()
    
    // viewDidLoad() 보다 먼저 호출되는 함수
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }
    
    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
    }
    
    // 로그인 버튼 누르면 동작하는 함수
    @objc func loginButtonTapped() {
        // 서버랑 통신해서, 다음 화면으로 넘어가는 내용 구현
        print("다음 화면으로 넘어가기")
    }
    
    // "비밀번호 재설정" 버튼이 눌렸을 때, 실행될 메서드
    @objc func resetButtonTapped() {
        //print("리셋버튼이 눌렸습니다.")
        
        // 얼럿창 만드는 방법
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .default) { cancel in
            print("취소버튼이 눌렸습니다.")
        }
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼이 눌렸습니다.")
        }
        
        alert.addAction(cancel)
        alert.addAction(success)
        
        // 다음 화면을 얼럿으로 넘어가는 메서드
        self.present(alert, animated: true, completion: nil)
    }
}
