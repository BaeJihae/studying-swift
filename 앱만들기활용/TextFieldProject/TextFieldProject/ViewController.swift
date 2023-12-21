//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 배지해 on 12/14/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 텍스트 필드의 대리자를 ViewController로 설정
        textField.delegate = self
        
        setUp()
        
    }
    func setUp() {
        view.backgroundColor = UIColor.lightGray
        // 유저가 편하게 어떤것을 입력할 수 있도록 키보드 타입을 설정할 수 있음.
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .go
        
        // UI화면 - 실제 터치 등 화면의 입력을 받아들이는 객체
        // UIWindow
        // Responder - 응답자 / 응답자 객체
        // 처음에 앱을 키면 키보드가 올라오게끔 설정하는 방법
        textField.becomeFirstResponder()
    }
    
    // 화면의 탭을 감지하는 함수
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        textField.resignFirstResponder()
    }
    
    
    // 텍스트 필드의 입력을 시작할 때 호출 ( 시작 허락 여부 )
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트 필드의 입력을 시작한 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트 필드의 입력을 시작했다.")
    }
    
    // 텍스트 필드의 문자열 전체 삭제 허락 여부
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트 필드의 글자 내용이 (한글자 한글자) 입력되거나 지워질 때 호출이 되고 ( 허락여부까지 결정 )
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //        print(#function)
        //        print(string)
        
        // 텍스트 필드의 최대 문자수를 제한
        //        let maxLength = 10
        //        let currentString: NSString = textField.text! as NSString
        //        let newString: NSString =
        //        currentString.replacingCharacters(in: range, with: string) as NSString
        //        return newString.length <= maxLength
        
        // 텍스트 필드의 최대 문자수를 제한2
        if ( textField.text?.count )! + string.count > 10 {
            return false
        }else{
            return true
        }
        
        // 입력되고 있는 글자가 "숫자"인 경우 입력을 허용하지 않는 논리
        //        if Int(string) != nil {
        //            return false
        //        }else {
        //            // 10글자 이상 입력되는 것을 막는 코드
        //            guard let text = textField.text else { return true }
        //            let newLength = text.count + string.count - range.length
        //            return newLength <= 10
        //        }
        
    }
    
    // 텍스트 필드의 엔터키가 눌러지면 다음 동작을 허락 여부
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        }else {
            return true
        }
    }
    
    // 텍스트 필드의 입력이 끝날 때 호출 ( 입력 종료 여부 결정 )
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트 필드의 입력이 끝나는 시점
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트 필드의 입력을 종료했다.")
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        // 키보드를 내리는 방법
        textField.resignFirstResponder()
        
    }
    
}
