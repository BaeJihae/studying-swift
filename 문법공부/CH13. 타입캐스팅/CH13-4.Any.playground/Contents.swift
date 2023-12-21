import UIKit


class Person {
    var name = "이름"
    var age = 10
}

class Superman {
    var name = "이름"
    var age = 10
}

// any타입 : 불특정한 타입 ( 어떤 타입의 인스턴스도 표현할 수 있는 타입 )
let any: [Any] = [5, "안녕", 3.5, Person(), Superman(), {(name: String) in return name}]

// ==> 단점 : 저장된 타입의 메모리 구조를 알 수가 없어서 항상 typecasting을 해야함.
// typeCasting
print(any[0] as? Int)
print(any[0] as! Int)

(any[1] as! String).count



// anyObject타입 : 어떤 클래스 타입의 인스턴스도 표현할 수 있는 타입
let anyobject:[AnyObject] = [Person(), Superman(), NSString()]


for (index, item) in any.enumerated(){
    switch item{
    case is Int:
        print("\(index)번 - \(item)은 Int타입입니다.")
    case let str as String:
        print("\(index)번 - \(str)은 String타입입니다.")
    case is Double:
        print("\(index)번 - \(item)은 Double타입입니다.")
    case let person as Person:
        print("\(index)번 - \(person)은 Person타입입니다.")
    case is (String) -> String:
        print("\(index)번 - 클로저 타입입니다.")
    default:
        print("\(index)번 - 그 이외의 타입입니다.")
    }
}
