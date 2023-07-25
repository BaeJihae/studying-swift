import UIKit

/*
 속성 감시자 ( Property Observer )
  : 속성 관찰자 ( 속성 감시하는 역할 )
*/

class Profile {
    
    // 일반 저장 속성
    var name: String = "이름"
    
    // 저장 속성 + 저장 속성이 변하는 시점을 관찰하는 메서드
    var statusMessage: String = "기본 상태메세지"{
        willSet(message){
            print("메세지가 \(statusMessage)에서 \(message)로 변경될 예정입니다.")
            print("상태메세지 업데이트 준비")
        }
    }
}

let p = Profile()

p.name
p.name = "전지현"

p.statusMessage
p.statusMessage = "행복해"

p.statusMessage = "우울해"



// 📝 Note. 기본적으로 "속성 감시자"라는 이름이지만, 성격은 메서드 -> 저장 속성 감시

// 저장 속성이 변하는 시점을 관찰
// willSet은 메모리 변경 직전에 실행
// didSet은 메모리 변경 직후에 실행

/* 속성 감시자에는 willSet과 didSet이 존재한다. */


class Profile1 {
    
    // 일반 저장 속성
    var name: String = "이름"
    
    // 저장 속성 + 저장 속성이 변하는 시점을 관찰하는 메서드
    var statusMessage: String = "기본 상태메세지"{
        willSet(message){ // 바뀔 값이 message에 저장
            print("메세지가 \(statusMessage)에서 \(message)로 변경될 예정입니다.")
            print("상태메세지 업데이트 준비")
        }
        didSet(message){ // 바뀌기 전의 과거 값이 message에 저장
            print("메세지가 \(message)에서 \(statusMessage)로 이미 변경되었습니다.")
            print("상태메세지 업데이트 완료")
        }
    }
    
    init(message: String){
        self.statusMessage = message
    }
}

let profile1 = Profile1(message: "기본 상태메세지")


profile1.statusMessage = "기분좋아"


/*
 
willSet과 didSet에서
파라미터를 생략하는 방법은
newValue와 oldValue를 사용할 수 있다.

 var statusMessage: String = "기본 상태메세지"{
     willSet{ // 바뀔 값이 message에 저장
         print("메세지가 \(statusMessage)에서 \(newValue)로 변경될 예정입니다.")
         print("상태메세지 업데이트 준비")
     }
     didSet { // 바뀌기 전의 과거 값이 message에 저장
         print("메세지가 \(oldValue)에서 \(statusMessage)로 이미 변경되었습니다.")
         print("상태메세지 업데이트 완료")
     }
 }
*/

/*====================================
 
 - 클래스, 구조체, 열거형 동일하게 적용
 
 - 어떤 속성이 변하는 시점을 알아차리도록 시점에 제약을 만드는 코드를 짜기는 어려움.
   ===> 그래서 앱을 만들고 활용할 때 좋은 수단이 됨.
 
 - 일반적으로는 willSet 또는 didSet 중에서 한가지만 구현
 ( 실제 프로젝트에서는 didSet을 많이 사용 )
 
 ====================================*/


// 속성 감시자를 추가 가능한 경우

// 1) 저장 속성 ( 원래, 상속한 경우 둘다 가능 )
// 2) 계산 속성 ( 상속해서 재정의 하는 경우에만 가능 )

// 계산 속성의 경우, 속성 관찰자를 만드는 대신 계산 속성의 set블록에서 값 변경을 관찰할 수 있기 때문에
// ( 재정의 (상속) 이 아닌 본래의 계산 속성에는 추가 불가)
// let 속성엔ㄴ 당연히 추가 안됨.
// 지연 저장 속성에는 불가능!!


// 📝note. 실제 값의 변경이 일어나지 않아도, 값을 set하는 작업을 하면 무조건 호출

// willSet / didSet 메커니즘

var x = 0

func willSetting(newValue: Int){
    print(newValue)
}

func didSetting(oldValue: Int){
    print(oldValue)
}

func setX(newX: Int){
    willSetting(newValue: newX)
    x = newX
    didSetting(oldValue: x)
}
