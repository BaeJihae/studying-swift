import UIKit

/* 2) 타입 메서드 */

class Dog {
    static var species = "Dog"
    
    var name: String
    var weight: Double
    
    init(name: String, weight: Double){
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(name)가 앉았습니다.")
    }
    
    func trainning() {
        print("\(name)가 앉았습니다.")
        sit()
        sit()
        self.sit()
    }
    
    func changeName(newName name: String) {
        self.name = name
    }
    // 타입 메서드,
    // 타입 속성에 접근시에는 타입으로 접근하지 않아도 됨.
    // species 대신 Dog.species 로 써도 된다.
    static func letmeknow() {
        print("종은 항상 \(species)입니다.")
    }
}

let bori = Dog(name: "보리", weight: 20.0)
bori.sit()

bori.changeName(newName: "말썽쟁이 보리")
bori.sit()

// ⭐️타입 메서드의 호출

Dog.letmeknow()


// 타입 메서드는 인스턴스 메서드가 아니기 때문에
// 인스턴스 기능이 아닌, 타입 자체에 필요한 기능을 구현할 때 주로 사용함.
// 타입 자체가 가져야 하는 공통된 기능(동작) 구현시


//=====================================================


/** 타입 메서드의 사용예시 **/

//Int.random(in: <#T##ClosedRange<Int>#>)
Int.random(in: 1...100)
Int.random(in: 1..<100)

//Double.random(in: <#T##Range<Double>#>
Double.random(in: 1.2...3.7)

//=====================================================

// !!상속!!


// 상위 클래스
class SomeClass {
    // 타입 메서드 ( 상속의 재정의를 위해 static 키워드 대신 class 키워드 사용 )
    class func someTypeMethod() {
        print("타입과 관련된 공통된 기능의 구현")
    }
}


SomeClass.someTypeMethod()


// 상속한 서브 클래스
class SomeThingClass: SomeClass {
    override class func someTypeMethod() {
        //super.someTypeMethod()
        print("타입과 관련된 공통된 기능의 구현(업그레이드)")
    }
}

SomeThingClass.someTypeMethod()


// 📝 note. class는 상속시 재정의 가능 키워드
