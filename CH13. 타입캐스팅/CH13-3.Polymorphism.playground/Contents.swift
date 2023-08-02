import UIKit


// 다형성 (Polymorphism)
// : 하나의 객체가 여러가지의 타입의 형태로 표현될 수 있음
//   또는 하나의 타입으로 여러 종류의 객체를 여러가지 형태로 해석될 수 있는 성격

// 캡상추다 중 하나

class Person {
    let id: Int = 0
    let name: String = "이름"
    let email: String = "abc@g.c"
    
    func walk() {
        print("사람이 걷는다.")
    }
}

class Student: Person{
    let studentId: Int = 1
    
    override func walk() {
        print("학생이 걷는다.")
    }
    
    func study(){
        print("학생이 공부한다.")
    }
}

class Undergraduate: Student{
    let major: String = "전공"
    
    override func walk() {
        print("대학생이 걷는다.")
    }
    
    override func study() {
        print("대학생이 공부한다.")
    }
    
    func party() {
        print("대학생이 파티한다.")
    }
}


let person1 = Person()
let student1 = Student()
let undergraduate1 = Undergraduate()

person1.id
person1.email
person1.name
person1.walk()

student1.id
student1.email
student1.name
student1.walk()
student1.study()

undergraduate1.id
undergraduate1.email
undergraduate1.name
undergraduate1.walk()
undergraduate1.study()
undergraduate1.party()

let person2: Person = Person()
let student2: Person = Student()
let undergraduate2: Person = Undergraduate()

person2.id
person2.email
person2.name
person2.walk()

student2.id
student2.email
student2.name
student2.walk()

// Person으로 업캐스팅하여 정의해서 study() 함수에 접근할 수 없음.
// student2.study()

undergraduate2.id
undergraduate2.email
undergraduate2.name
undergraduate2.walk()
// Person으로 업캐스팅하여 정의해서 study(),party 함수에 접근할 수 없음.
// undergraduate2.study()
// undergraduate2.party()


let array: [Person] = [Person(), Student(), Undergraduate()]

for a in array{
    a.walk()
}

array[0].walk()
array[1].walk()
array[2].walk()


/**=============================================================
 
 상속된 클래스를 업캐스팅하여 인스턴스를 찍어내더라도
 인스턴스는 상위 클래스의 데이터를 가리키는 것이 아니라
 자기 자신의 데이터를 가리키면서,
 상위 클래스에 들어있는 데이터들의 접근 가능성만 부여한 것이므로
 하위 클래스의 재정의된 함수를 출력한다면,
 재정의된 함수가 출력된다.

 =============================================================**/
