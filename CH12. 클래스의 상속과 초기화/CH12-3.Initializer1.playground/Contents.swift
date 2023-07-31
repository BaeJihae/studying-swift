import UIKit

/*:
## 3) 초기화 (Initialization)
### 초기화와 생성자 (Intializer)
 ---
*/

/**=====================================================================
 - 초기화는 클래스, 구조체, 열거형의 인스턴스를 생성하는 과정임
 - 각 "저장 속성"에 대한 초기값을 설정하여 인스턴스를 사용가능한 상태로 만드는 것
   (열거형은 저장속성이 존재하지 않으므로, case중에 한가지를 선택 및 생성)

 - 결국, 이니셜라이저의 실행이 완료되었을 때,
 - 인스턴스의 모든 저장속성이 초기값을 가지는 것이 ==> 생성자(Initializer)의 역할

 - 참고) 소멸자
 - 생성자와 반대개념의 소멸자(Deinitializer)도 있음
 - 소멸자 ==> 인스턴스가 해제되기 전에 해야할 기능을 정의하는 부분
=====================================================================**/

//:---

// 구조체, 클래스, (열거형)모두 동일

class Dog {
    var name: String
    var weight: Double
    
    init() {
        name = "배지해"
        weight = 51.3
    }
    
    init(name: String){
        self.name = name
        self.weight = 2.0
    }
    
    init(k: String, d: Double){
        self.name = k
        self.weight = d
    }
    // 생성자
    init(name: String, weight: Double){
        self.name = name
        self.weight = weight
    }
}

var dog1 = Dog()
// var dog1 = Dog.init()

var dog2 = Dog(name: "배지해")
//var dog2 = Dog.init(name: "배지해")

var dog3 = Dog(k: "지우", d: 2.0)
//var dog3 = Dog.init(k: "지우", d: 2.0)

var dog4 = Dog(name: "채원", weight: 41)
//var dog4 = Dog.init(name: "채원", weight: 41)



/**
 ==========================================================
 초기화의 방법 (모든 저장속성이 초기값을 가지도록 만드는 방법)
 1) 인스턴스 생성 과정에서 초기값 설정
 2) 저장 속성을 옵셔널로 선언 ( nil 로 초기화가 됨. )
 3) 생성자를 통한 초기화
 
 굳이 생성자를 생성하지 않더라도 모든 저장 속성이 초기화가 되어있다면,
 스위프트에서 자동으로 기본 생성자 (Default Initializer)를 만듬 ----> " init() "
 
 하지만, 사용자가 이니셜라이즈를 한 개라도 구현했다면,
 기본 생성자는 생성되지 않음.
 
 ⭐️ 생성자 오버로딩(Overroding)을 지원
 - 다양한 파라미터 조합으로 생성자를 여러개 구현 가능하다.
 - 여러가지 방시으로 인스턴스를 생성하는 방법을 제공
 ==========================================================
 **/


class Color {
    
    // 타입이 같다면, 한 줄로 선언 가능
//    let red, blue, green: Double
    
    // 옵셔널로 선언한다면, 초기화를 설정하지 않아도 오류가 나지 않음.
//    let red, blue, green: Double?
    
    var red: Double = 0.0
    var blue: Double = 0.0
    var green: Double = 0.0

    // 모든 저장 속성이 초기화가 되어있다면,
    // init()을 생성하지 않아도, 아래와 같이 스위프트에서 자동으로 생성
    // 기본 생성자
    init() {
        red = 0.0
        blue = 0.0
        green = 0.0
    }
    
    // 생성자도 오버로딩(Overloading)을 지원 (파리미터의 수, 아규먼트 레이블, 자료형으로 구분)

    init(white: Double){
        red = white
        blue = white
        green = white
    }

    init(red: Double, blue: Double, green: Double){
        self.red = red
        self.blue = blue
        self.green = green
    }
    
}

// 객체를 생성할 때, .init은 생략하능

var color1 = Color()
var color2 = Color.init()

var color3 = Color(white: 3)
var color4 = Color.init(white: 3)

var color5 = Color(red: 3, blue: 5, green: 6)
var color6 = Color.init(red: 4, blue: 5, green: 6)




/*:
 ---
* 멤버와이즈 이니셜라이저 - 구조체의 특별한 생성자
 ---
 */

//:> 구조체는 멤버와이즈 이니셜라이저를 자동으로 제공한다.

struct Color2 {
    var red: Double = 0.0
    var blue: Double = 0.0
    var green: Double
}

Color2.init(green: 3.0)


/**
 생성자의 기본 원칙
 - 컴파일러는 기본 생성자 (init())을 자동으로 구현함.
 ( but, 사용자가 이니셜라이즈를 생성했을 때는 구현 안함. )
 
 - 구조체는 저장 속성들이 기본값을 가지고 있더라도,
   추가적으로 Memberwise멤버와이즈(멤버에 관한) 이니셜라이저를 자동으로 제공함
 
 - 개발자가 직접적으로 생성자를 구현하면, 멤버와이즈 이니셜라이저가 자동으로 제공되지 않음 ⭐️
   (멤버와이즈 이니셜라이저는 편의적 기능일뿐)
 
 // 구조체에서만 선언된 저장 속성의 이름을 파라미터로 제공하기 때문에
 // 멤버에 관한 생성자를 제공한다는 뜻에서 멤버와이즈 이니셜라이저라고 부름
 // (Memberwise 뜻: 멤버에 관하여) ( ~ wise:  ~ 에 관하여)
 **/


/**==================================================
 - 왜 멤버와이즈 이니셜라이저를 제공할까?
 
 - 굳이 이유를 찾자면, 클래스보다 더 편하게 쓰기 위함일 것으로 추측
 - 클래스의 경우에는, 생성자가 상속하고 관련이 있기 때문에 복잡
=====================================================**/



