import UIKit


class Dog {
    // name의 접근 권한을 private로 설정한다면,
    private var _name = "강아지"
    
    // 외부에서 함수를 이용해 name을 변경할 수 있다.
    func changeName( name: String){
        self._name = name
    }
    func selfgreeting() {
        print("나의 이름은 \(_name)입니다.")
    }
}

var borri = Dog()

// 클래스의 외부에서는 borri.name에 접근이 불가능 하다.(쓰기/읽기 모두 제한 )

// 클래스 내부 함수를 이용해 private 변수에 접근 가능
borri.changeName(name: "보리")
borri.selfgreeting()



