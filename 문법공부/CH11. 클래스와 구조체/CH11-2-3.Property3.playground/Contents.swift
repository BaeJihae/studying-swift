import UIKit

/*
 타입속성 ( type properties )
 */

class Dog {
    
    // static : 고정적인, 고정된
    // 타입 자체에 속한 저장 속성 ( 모든 인스턴스의 변하지 않는 속성 )
    static let species: String = "Dog"
    
    var name: String
    var weight: Double
    
    init(name: String, weight: Double){
        self.name = name
        self.weight = weight
    }
}

let dog = Dog(name: "초코", weight: 15.0)
dog.name
dog.weight

// 클래스에 저장된 속성이기 때문에
// 인스턴스에 .을 찍어도 보이지 않음
Dog.species







// 1. 저장 타입 속성

class Circle {
    // (저장) 타입 속성 - 값이 항상 존재해야함
    static let pi: Double = 3.14
    // 몇 개의 인스턴스(객체)를 찍어내는지 확인하기 위한 변수
    static var count: Int = 0
    
    var radius: Double
    
    var diameter: Double {
        get {
            return radius * 2 * Circle.pi
        }
        set {
            radius = newValue / (2 * Circle.pi)
        }
    }
    
    init(radius: Double) {
        self.radius = radius
        // 생성자 함수가 호출될 때마다 count가 1 올라감.
        // 즉, 객체를 생성할 때마다 count가 1 올라감.
        Circle.count += 1
    }
}

Circle.pi
Circle.count

var circle1 = Circle(radius: 2)

circle1.radius
circle1.diameter

Circle.pi
Circle.count

var circle2 = Circle(radius: 4)
Circle.count

var circle3 = Circle(radius: 8)
Circle.count
circle3.diameter = 50.24
circle3.radius





// 실제 사용 예시)
// 저장 타입 속성 확인하는 것

Int.max
Int.min

Double.pi
Double.infinity






// 2. 계산 타입(형식) 속성

class Circle1 {
    static let pi: Double = 3.14
    static var count: Int = 0
    
    // (계산) 타입 속성 ( read-only )
    
    // static = class
    // class로 선언할 경우 상속에서 재정의 가능
    class var multiPi: Double {
        return Circle1.pi * 2
    }
    
    // 저장 속성
    var radius: Double
    
    // 생성자
    init(radius: Double) {
        self.radius = radius
    }
}



/*
 
 저장 타입 속성
 - 일반 저장 속성은 인스턴스를 생성할 때, 생성자에서 모든 속성을 초기화를 완료.
   그리고, 해당 저장 속성은 각 인스턴스가 가진 고유한 값임
 - 하지만, 저장 타입(형식) 속성은 생성자가 따로 없기 때문에, 타입 자체( 유형 그 자체 )에
   속한 속성이기 때문에 항상 기본값이 필요, 생략할 수 없음.
 
 - ⭐️ 지연 속성의 성격을 가짐
 
 - 저장 타입속성은 기본적으로 지연 속성 ( 속성에 처음 접근하는 순간에 초기화됨 )이지만,
   lazy라고 선언할 필요는 없음!
 ( 참고 : 여러 스레드에서 동시에 엑세스하는 경우에도 한번만 초기화되도록 보장됨. Thread-Safe )
 
 */


// 📝 note. 인스턴스 내에서도 접근하려면 타입이름 + 속성으로 써야 접근이 가능함



class Circle2 {
    static let pi: Double = 3.14
    static var count: Int = 0
    
    // 저장 속성
    var radius: Double
    
    // 생성자
    init(radius: Double) {
        self.radius = radius
        Circle2.count += 1
    }
    
    func getArea() -> Double {
                   // 타입이름으로 접근해야한다.
        let area = Circle2.pi * radius * radius
        return area
    }
}

let c1 = Circle2(radius: 3)
c1.getArea()
Circle2.count



/*================================================
- 어떤 경우에 타입 속성을 선언해야 하나?
 
 : 모든 인스턴스가 동일하게 가져야 하는 속성이거나
   모든 인스턴스가 공유해야하는 성격에 가까운 이어야 함
 
 - 상속에서 재정의 ( overriding )
 
 1) 저장 타입 속성 -> 상속에서, 하위 클래스에 재정의 불가능 ( class 키워드 불가능 )
                    ( 인스턴스의 경우도 저장 속성은 고유의 틀이기 때문에 건들일 수 없음 )
 2) 계산 타입 속성 -> 상속세엇, 상위 클래스에서 class. 키워드를 붙인 경우, 재정의 가능
 
 
 class 키워드 ( 계산 타입 속성에만 해당 )
 
: 상속이 있는 경우, 계산 타입 속성에서는 static대신 class 키워드를 사용
 -> static과 동일한 역할 이지만 재정의 가능한 속성이 된다.
================================================*/
