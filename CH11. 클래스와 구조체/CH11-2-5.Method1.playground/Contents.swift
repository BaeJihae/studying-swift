import UIKit

/* Part 11 -2 구조체, 클래스의 메서드 */

/* 1) 인스턴스 메서드 ( Instance Methods ) */

class Dog {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(name)가 앉았습니다.")
    }
    func layDown() {
        print("\(name)가 누웠습니다.")
    }
    func play() {
        print("열심히 놉니다.")
    }
    func changeNAme(newName name: String) {
        self.name = name
    }
}

let bori = Dog(name: "보리", weight: 20.0)

//bori.sit()
//bori.layDown()
//bori.play()

let choco = Dog(name: "초코", weight: 20.0)


class Dog1 {
    var name: String
    var weight: Double
    
    static var species: String = "개"
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(name)가 앉았습니다.")
    }
    
    // 인스턴스(객체)의 메서드는 인스턴스의 다른 메서드를 호출 가능하다.
    func trainning() {
        print("월월 저는 \(Dog1.species)입니다.")
        sit()
        sit()
        self.sit()
    }
    
    func changeNAme(newName name: String) {
        self.name = name
    }
}

let bori1 = Dog1(name: "보리", weight: 20.0)
bori1.trainning()

bori1.changeNAme(newName: "말썽쟁이보리")
bori1.sit()


/* 구조체의 인스턴스 메서드 (Instance Methods) */

// - 값 타입 (구조체, 열거형)에서 기본적으로 인스턴스 메서드 내에서 속성을 수정할 수 없음
// - 수정하려면, mutating(변형되는)키워드를 붙이면 속성 수정 가능해짐(클래스와 구조체의 차이)


struct Dog2 {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(name)가 앉았습니다.")
    }
    
    func sit(a: String) {
        print("\(name)가 \(a)하며 앉았습니다.")
    }
    
    mutating func changeNAme(newName name: String) {
        self.name = name
    }
}

// 📝 note.
// 구조체에서는 자기 자신의 속성을 변경할 땐, 무조건 mutating 키워드를 붙어야 한다.
// 원칙으론 바꿀 수가 없다. 그러니 바꿈을 허락하는 키워드를 붙이는 것



/* 오버로딩 ( overloading ) */

var d777 = Dog2(name: "뽀리", weight: 10)
d777.sit()
d777.sit(a: "안녕")
