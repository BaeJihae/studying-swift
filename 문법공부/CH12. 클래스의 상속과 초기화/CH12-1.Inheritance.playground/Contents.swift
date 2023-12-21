import UIKit


/*:
 # CH12. 클래스의 상속과 초기화
 */
//: ## 1) 클래스의 상속
//: * 상속 ( Inheritance)
//:---
// : 본질적으로 성격이 비슷한 타입을 만들어서
// 1) 데이터를 추가하거나
// 2) 데이터를 변경시켜
// 사용하는 것
//:> 상속은 유일하게 클래스만 가능 ( 구조체 불가능 )


/*: * 기본적인 상속 문법
---
 */
class AClass {
    var name = "이름"
}

class BClass: AClass {
    // AClass를 상속했기 때문에
    // AClass에 속해 있는
    // name이라는 변수가 존재함.
    var id = 0
}

var B = BClass()
B.name

//:> final : 클래스의 상속 금지 키워드

// final 키워드 : 더이상 상속이 불가능하다.
// final 키워드는 class 앞에도, 객체의 속성 앞에도 사용 가능하다.
// 만약 객체의 속성 앞에 final이 있다면, 그 객체는 재사용이 불가능하다.
final class CClass: BClass {
    var grade = 0
}



// 슈퍼클래스, 부모클래스, 상위클래스
class Person {
    var name: String = "배지해"
    var id: Int = 0
    var email: String = "qowlgo00@naver.com"
}

// 하위클래스, 자식클래스, 서브클래스
class Student: Person{
    // id
    // name
    // email
    var studentID: Int = 0
}

class Undergraduate: Student{
    // id
    // name
    // email
    // studentID
    var major: String = "수학과"
}


// 상속한다는 것을 Subclassing 한다라고 말하기도 한다.
// * 다중 상속 불가능 : 하위 클래스는 한 개의 상위 클래스만을 가질 수 있다.

/*:
 * UIkit의 상속 구조
 ---
 */
// 애플이 만든 UIkit도 많은 수직확장을 통한 상속으로 이루어져 있다.

