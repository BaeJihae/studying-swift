import UIKit

// self 키워드 : ( 소문자로 시작 )
// 인스턴스를 가리킴.

// Self 키워드 : ( 대문자로 시작 )
// 타입을 가리킴.
// 자신이 속해있는 타입을 가리킴.


// self 키워드가 쓰이는 경우

// 1. 자신의 인스턴스를 가리킬 때,

class Student {
    var name = "배지해"
    func setName(_ name: String){
        self.name = name
    }
}

// 2. 구조체나 열거형에서 새로운 값으로 속성 초기화 하는 경우

struct Calculater {
    var number = 0
    
    mutating func reset() {
        self = Calculater()
    }
}

// 구조체나 열거형에서는 자신의 인스턴스의 속성을 변경하는 경우에는 mutating 키워드를 사용한다.


var a = Calculater()

a.number = 5
a.number

a.reset()
a.number

// 3. 타입 멤버에서는 인스턴스가 아닌 타입 자체를 가리킴.
struct A {
    static var a = 0
    func printing() {
        print("a는 \(A.a)입니다.")
    }
}
    // static 함수가 아닌 함수에서 self.a 키워드는 오류가 난다.
    // 인스턴스 멤버에 a라는 변수가 없기 때문이다.
    // 이런 경우엔 self.a 가 아닌 A.a를 사용해야한다.

// 4. 외부에서 타입 인스턴스를 가리키는 경우

class Someclass {
    static var something = 0
}

// 여기서 타입 인스턴스란 클래스에서 타입으로 선언해놓은 그 자체를 타입 인스턴스라고 한다.
let myclass: Someclass.Type = Someclass.self
// 위의 코드는 메타타입에서 한번더 배울 예정
// 아무튼 인스턴스가 아닌 타입 인스턴스를 가리킬 때에는 클래스나 구조체 명.self를 쓰면 된다


// Self 키워드가 쓰이는 경우

//1. 타입을 선언하는 위치에 사용
// Int 타입 확장
extension Int {
    
    // 인스턴스 계산 저장 속성
    var zero: Self {
        return 4
    }
    
    // 타입 저장 속성
    static var zero: Self = 6
    
    func toZero() -> Self {
        return self.zero
    }
    
    static func toZero() -> Self {
        return Self.zero
    }
}

Int.zero
3.zero

3.toZero()
Int.toZero()


//2. 타입 속성 / 메서드를 지칭하는 곳에 사용
//3. 프로토콜에 사용

// 프로토콜에서 Self 키워드를 사용하면 채택한 타입을 의미한다.

protocol remote {
    func turnOn() -> Self
}

// 스트링 타입을 확장하면서 remote 프로토콜을 채택
extension String: remote { e
    func turnOn() -> String {
        return "tv를 켜다"
    }
}
