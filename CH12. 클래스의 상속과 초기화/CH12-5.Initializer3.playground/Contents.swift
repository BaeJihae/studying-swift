import UIKit

/*:
 ## 클래스 지정, 편의 생성자의 상속과 재정의
 */
//: * 생성자의 상속과 재정의
//: ---

/**============================================
 
 하위클래스는 상위클래스를 상속하지않고, 재정의하는 것이 원칙!
 - 하위클래스에서 초기화를 할 때 실수를 방지하기 위함 ( 하위클래스에서 최적화가 되어 있지 않음 )
 - 안전한 경우에만 상위클래스의 생성자가 자동 상속됨.
 
 - 하위클래스의 커스텀 생성자를 구현하기 전에 ⭐️ 상위클래스의 재정의 생성자를 작성해야 실수하지 않음!
 
 재정의란? 동일한 이름의 생성자를 구현하는 것
 커스텀 생성자란?
 
 ============================================**/


//:> 생성자 상속시 구현 규칙

/**===================================================
 
✅ 원칙 1) 상위의 지정생성자(이름/파라미터)와 2) 현재 단계의 저장속성을 고려해서 구현
 
 [ 1단계 ]
 - (상위) 지정 생성자 : 재정의 필수 고려
    --> 1. (하위) 지정 생성자
    --> 2. (하위) 편의 생성자
    --> 3. 구현 안해도 됨.
                    
 - (상위) 편의 생성자 : 재정의 불가
    --> 재정의 불가능
    --> (동일한 이름이 존재한다면) 새롭게 정의한 것

 [ 2단계 ]
 - (하위) 1. 현재 모든 저장 속성 초기화 및 상위의 지정 생성자 호출
 - (하위) 2. 현재 편의 생성자 : 현재 클래스의 지정 생성자 호출
 
 
 --> 결국 지정생성자만이 모든 저장 속성을 초기화 가능!
 ==================================================**/



class Aclass {
    var x: Int
    
    // 만약 x의 초기값을 설정해줬다면,
    // 생성자를 구현하지 않아도 자동으로 생성이 됨. -> init()
    
    init(x: Int){
        self.x = x
    }
}

// ⭐️ Aclass의 지정생성자
// - init(x: Int)

class Bclass: Aclass {
    var y: Int
    
    // 1단계 - 1. Aclass(상위클래스)의 지정생성자 => 지정생성자로 호출
    override init(x: Int) {
        self.y = 0
        super.init(x: x)
    }
    
    // 1단계 - 2. Aclass(상위클래스)의 지정생성자 => 편의생성자로 호출
//    override convenience init(x: Int) {
//        self.init(x: x, y: 2)
//    }
    
    // 1단계 - 3. 구현을 안해도 된다.
    
    
    // 2단계 - 현재 모든 저장 속성 초기화 및 상위 지정 생성자 호출
    // 오버로딩 가능
    
    convenience init(y: Int){
        self.init(x: 0, y: y)
    }
    
    init(x: Int, y: Int){
        self.y = y
        super.init(x: x)
    }
    
}

// ⭐️ Bclass의 지정생성자
// - init(x: Int)
// - init(x: Int, y: Int)

class Cclass: Bclass {
    var z: Int
    
    override init(x: Int) {
        self.z = 0
        super.init(x: x)
    }
    
    override init(x: Int, y: Int) {
        self.z = 0
        super.init(x: x, y: y)
    }
    
    init(x: Int, y: Int, z: Int){
        self.z = z
        super.init(x: x, y: y)
    }
}


//:---
//:* 애플 공식 문서의 예제로 복습
//:---
class Vehicle {
    // 저장 속성
    var numberOfWheels = 0
    // 계산 속성
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
    // init()이 자동 생성
    
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
// Vehicle: 0 wheel(s)


// Vehicle의 하위 클래스
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
// Bicycle: 2 wheel(s)

// Vehicle의 하위 클래스
class Hoverboard: Vehicle {
    // Hoverboard의 새로운 저장 속성
    var color: String
    // Hoverboard의 지정 생성자
    init(color: String) {
        self.color = color
        // super.init() implicitly called here
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")
// Hoverboard: 0 wheel(s) in a beautiful silver
