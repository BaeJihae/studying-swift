import UIKit

/*:
 ## 4) 생성자(Initializer)
 
 */
/*:
 ---
 * 구조체 VS 클래스 생성자 (Initializer)
 ---
 
 **/

/*
 
 
 
 
 */


//: ### 구조체 생성자
//:---
//:* 여러개의 지정 생성자 구현
//:---

//:> 구조체나 클래스, 둘 다 아래처럼 구현 가능 (오버로딩 지원)

// 올바른 방식이 아님!

struct Color1 {
    var red, green, blue: Double
    
    init() {
        red = 0
        green = 0
        blue = 0
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}


/*:
 ---
 * 구조체(값타입)의 지정생성자의 구현
 ---
 */
struct Color2 {
    var red, green, blue: Double
    
    // ⭐️ 다른 구조체를 호출하는 방식도 가능
    init() {
        self.init(red: 0.0, green: 0.0, blue: 0.0)
    }
    
    // ⭐️ 다른 구조체를 호출하는 방식도 가능
    init(white: Double) {
        self.init(red: white, green: white, blue: white)
    }
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

var c = Color2()

c.red
c.blue
c.green

// 구조체의 경우에는 자체 지정 생성자를 작성할 때,
// 생성자내에서 self.init(..)을 사용한 다른 이니셜라이즈를 호출하는 것이 가능하다.


//: ### 클래스 생성자
//:---
//: * 클래스의 지정(Designated) VS 편의 생성자(Convenience)
//:---

// 일반적인 생성자를 지정 생성자
// convenience가 붙으면 편의 생성자

/*
 
 편의생성자는 편리하게 생성하기 위한 서브(Sub)생성자라고 보면됨. ( 메인이 아님 )
 ===> (메인) 지정 생성자에 의존하는 방식 (지정 생성자 호출)
 
 - 지정 생성자 : 모든 속성을 초기화 해야함.
 - 편의 생성자 : 모든 속성을 초기화 할 필요가 없음.
 
 ⭐️
 - 클래스는 상속을 진원하므로, 변수가 여러개이고,
 - 여러 지정 생성자를 지원했을 때 상속 관계에서 개발자가 실수할 수 있는 여러가지 가능성이 있음.
 - 따라서, 초기화 과정을 조금 간편하게 만들어주고,
 - 상속관계에서 개발자가 실수 할 수 있는 여러 가능성을 배제하기 위한 생성자임.
 
 - 반대로 말하자면 모든 속성을 초기화하지 않는다면 ==> 편의생성자로 만드는 것이 복잡도나 실수를 줄일 수 있음
 - 결국, 생성자의 가능한 중복을 없애고, 다른 지정 생성자를 호출하는 패턴으로 구현된 것!
 
*/

class Color3 {
    var red, green, blue: Double
    
    // ⭐️ 다른 구조체를 호출하는 방식도 가능
    convenience init() {
        self.init(red: 0.0, green: 0.0, blue: 0.0)
    }
    
    // ⭐️ 다른 구조체를 호출하는 방식도 가능
    convenience init(white: Double) {
        self.init(red: white, green: white, blue: white)
    }
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

//:> 이미 모든 속성을 초기화하는 지정 생성자가 있다면 모든 속성을 초기화하지 않는 경우 편의 생성자로 구현을 권장!


/*:---
 * 클래스의 상속과 지정/편의 생성자 사용 예시
 ---
 */

class Aclass {
    var x: Int
    var y: Int
    
    // 지정생성자 -
    init(x: Int, y: Int){
        self.x = x
        self.y = y
    }
    
    convenience init(){
        self.init(x: 0, y: 0)
    }
}

class Bclass: Aclass{
    
    var z: Int
    
    init(x: Int, y: Int, z: Int){
        self.z = z
        //self.y = 4
        super.init(x: x, y: y)
        //self.y = 3
        //self.z = 5
    }
    
    convenience init(v: Int){
        //self.z = 1
        self.init(x: v, y: v, z: v)
        self.z = 1
    }
    
    convenience init(){
        self.init(v: 0)
    }
}

/*:---
 * 클래스의 상속과 지정생성자와 편의생성자의 호출 규칙
 ---
 */

/**=======================================
 생성자 위임 규칙
 
 1) 델리게이트 업 (Delegate up)
 : 하위 클래스의 지정 생성자는 반드시 상위 클래스의 지정 생성자를 호출해야한다.
 ( 하위 클래스의 저장 속성을 초기화하고 상위 클래스의 저장 속성을 초기화하는 과정 )
 
 2) 델리게이트 어크로스(Delegate across)
 : 편의 생성자는 동일한 클래스의 지정생성자 또는 다른 편의 생성자를 호출해야한다.
 ( 궁극적으로 지정 생성자만이 해당 단계의 모든 저장값을 초기화 함.)
 
 ===> 인스턴스 메모리 생성에 대한 규칙이 존재함(규칙을 안지키면 인스턴스가 올바르게 초기화되지 않음)
 ======================================= **/

/*:---
 * 클래스의 상속과 초기화 과정의 이해( 2단계 초기화 과정 ) - 그림으로 이해 ⭐️
 ---
 */

/**=======================================
 - 인스턴스의 모든 저장 속성이 초기값을 가지면 완전히 초기화된 것임(생성 완료)

 - 각 단계에서 선언된 저장속성은 각 해당 단계에서 초기값을 가져야 함
 - ===> 그리고나서 수퍼클래스로 생성 위임(델리게이트 업)이 일어나야 함
 
 [ 1단계 ] 메모리 초기화 (값설정)
 - 해당 클래스에서 선언한 모든 저장속성에 값이ㄴ∑는지 확인하여 메모리 초기화
 - 상위 지정생성자로 델리게이트 업하여 (해당 단계의) 모든 저장 속성의 메모리 초기화
 - (최종적으로) Base 클래스가 모든 저장 속성에 값이 있는지 확인하면
 - 저장속성이 완전히 초기화 된 것으로 간주되어 인스턴스가 생성 완료
 
 (선택사항)
 [ 2단계 ] 커스텀 설정 (설절값을 바꾸거나, 메서드 실행)
 - 인스턴스의 생성 완료 후,
 - 상속관계의 맨 위에서 아래로 내려가면서, 호출된 각각의 생성자가 인스턴스를 추가로 커스텀함
 - (커스텀의 의미: 새로운 값을 셋팅하거나 메서드 호출 등이 가능)
 - 메모리가 초기화가 완료된 후이므로
 - 이제 self 속성에 접근이 가능해지고, 속성을 수정하거나 인스턴스 메서드를 호출이 가능해짐
 
 ======================================= **/


