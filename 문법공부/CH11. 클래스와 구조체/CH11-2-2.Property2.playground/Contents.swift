import UIKit

/* 계산 속성 */


// 쉬운 예시

class Person {
    
    // birth는 저장 속성
    var birth: Int = 0
    
    // 계산 속성 ( get과 set은 실질적으로는 함수이다. )
    // 타입 필수, let XX
    var age: Int{
        get{
            return 2021 - birth
        }
        set(age){
            self.birth = 2021 - age
        }
    }
    
    // set 블럭에서 파라미터 생략가능! 대신 age 대신 newValue라는 값을 써야함!
    // 또한 set 블럭은 생략 가능함.'
    
//    var age: Int{
//        get {
//            return 2021 - birth
//        }
//        set {
//            self.birth = 2021 - newValue
//        }
//    }

// 계산속성이 필요한 이유는 원래는 두가지의 활동을 해야하는데 그것을 하나로 줄여줌.
    
//// get 블럭만 구현이 될때는 이렇게 표현할 수도 있다.
//    var age: Int {
//        return 2021 - birth
//    }
//
//
//    func getAge() -> Int {
//        return 2021 - birth
//    }
//
//    func setAge(_ age: Int) {
//        self.birth = 2021 - age
//    }
}


var p1 = Person()
p1.birth = 2000
// get
p1.age
// set
p1.age = 20

//p1.getAge()
//p1.setAge(20)


/*
 계산 속성 ( Computed Properties )
*/

// 좀 더 어려운 예시

class PersonBMI {
    var name: String = "사람"
    var height: Double = 160.0
    var weight: Double = 51
    
//    func calculateBMI() -> Double {
//        let bmi = weight / (height * height)  * 10000
//        return bmi
//    }
//    func setWeightWithBMI(bmi: Double) {
//        weight = bmi * height * height / 10000
//    }
    
    // 계산 속성으로 표현한 BMI 문법
    var bmi: Double {
        get {
            return weight / (height * height) * 10000
        }
        set(bmi) {
            weight = bmi * height * height / 10000
        }
    }
    
}

let p = PersonBMI()

p.height = 160
p.weight = 52
print(p.bmi)
p.bmi = 20
print(p.weight)


// 계산 속성 메서드가 get 블럭만 가지고 있다면 아래와 같이 표현 가능하다. ( get 블럭 생략 가능 )
/**===================================
 var bmi: Double {
    return weight / (height * height) * 10000
 }
 ===================================**/

// set 블럭의 파라미터를 생략하고 'newValue'로 대체 가능하다.
/**===================================
 var bmi: Double {
     get {
         return weight / (height * height) * 10000
     }
     set {
         weight = newValue * height * height / 10000
     }
 }
 ===================================**/


// 메서드가 아닌 속성방식으로 구현하면 무슨 장점이 있나??
// - 관련이 있는 두가지 메서드를 한번에 구현가능
// - 외부에서 보기에 속성이름으로 설정가능 ( 보다 명확하고 간결 )
// - 계산 속성은 메서드를 개발자들이 보다 읽기 쉽고, 명확하게 쓸 수 있는 형태인 속성으로 변환해 놓은 것

// - ⭐️ 실제로 계산 속성은 겉모습은 속성( 변수 ) 형태를 가진 메서드 ( 함수 ) 이다.
// - 계산 속성은 실제 메모리 공간을 가지지 않고, 해당 속성에 접근했을 때, 다른 속성에 접근해서 계산한 후,
//   그 계산 결과를 리턴하거나 세팅하는 메서드 이다.


/*

 주의점
 
 계산 속성 ( 연산 속성 / 프로퍼티 ) -> 클래스, 구조체, 열거형 등에 쓰임
 ❗️ 항상 변하는 것이니깐 var 변수로만 선언 가능
 ❗️ 자료형 선언을 해야함 ( 형식 추론 불가능 ) / 메서드이기 때문에 파라미터, 리턴형이 필요한 개념
 ❗️ get은 반드시 선언해야함 ( set은 선택 )

 getter ( get 블록 ) / setter ( set 블록 )
 
 */
