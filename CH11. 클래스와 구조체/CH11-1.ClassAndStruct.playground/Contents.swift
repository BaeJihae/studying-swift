import UIKit

//Part 11 - 클래스(Class)와 구조체(Struct)



/*
     1) 클래스 (Class)
 
     - 객체지향 프로그래밍
     
     - Class의 변수는 속성(property)
     - Class의 함수는 메서드(method)
     라고 한다.

*/


// class(클래스)의 명은 항상 대문자로 시작!
class Dog {
    
    // 클래스의 변수 = 속성
    var name = "강아지"
    var age = 0
    var weight = 0.0
    
    // 클래스의 함수 = 메서드
    func sit() {
        print("\(name)가 앉았습니다.")
    }
    
    func eat() {
        print("\(self.name)먹었습니다.")
    }
}


// Dog이라는 틀을 가지고 bori라는 객체를 만드는 것
// 객체 생성
var bori = Dog()


// 객체의 속성에 접근
bori.name
bori.age
bori.weight

bori.name = "보리"
bori.age = 3
bori.weight = 10

bori.name
bori.age
bori.weight



// Dog이라는 틀을 가지고 choco라는 객체를 만드는 것
// 객체 생성
var choco = Dog()

// 객체의 속성에 접근
choco.name
choco.age
choco.weight

choco.name = "초코"
choco.age = 9
choco.weight = 7

choco.name
choco.age
choco.weight

choco.sit()
choco.eat()







/*
    2) 구조체 (Struct)
    - 객체지향 프로그래밍
    
    클래스와 달리 구조체로 만들어진 실제 데이터를 객체가 아닌 인스턴스라고 부른다.

*/

// 구조체 명도 마찬가지로 대문자로 시작해야한다.
struct Bird {
    var name = "새"
    var weight = 0.0
    
    func fly(){
        print("몸무게가 \(self.weight)인 \(name)가 날아갑니다.")
    }
}


// 인스턴스 생성
var aBird = Bird()


// 인스턴스의 속성에 접근
aBird.fly()

aBird.name = "a참새"
aBird.weight = 7

aBird.fly()







/*
    클래스와 구조체
 
 - 클래스와 구조체 모두 메모리에서 찍어낸 실제 데이터를 인스턴스(instance)라고 한다.
 - 클래스에서는 특별히 인스턴스를 객체라고 부른다.
 
 [ 사용자 정의 타입 ]
 - 클래스(class)의 인스턴스(객체)
 - 구조체(struct)의 인스턴스
 - 열거형(enum)의 인스턴스

 
 ===========================================
 클래스와 구조체의 차이점
 ===========================================
 
 가장 큰 차이점은 메모리의 저장 방식이다.
 
 
 1) 클래스 (Class)
 - Reference Type (참조 형식)
 - 클래스 자체의 틀을 데이터에 저장한다.
 - stack에서 클래스의 객체를 생성하면,
   클래스의 객체를 생성한 변수에 객체의 값 자체를 저장시키는 것이 아닌
   객체가 저장된 주소값만을 저장한다.
   즉, 클래스의 객체는 Heap에 저장이 된다.
 - ARC시스템을 통해 메모리 관리 (ARC 시스템이 먼디..?)
   
 
 2) 구조체 (Struct)
 - Value Type (값 형식)
 - 구조체 자체의 틀을 데이터에 저장함.
 - stack에서 구조체의 인스턴스를 생성하면,
   구조체의 인스턴스를 생성한 변수에 인스턴스의 값 자체를 저장시킴.
 - 인스턴스를 복사를 하면, 새로운 데이터를 복사하는 형식
 - 만약 main에서 stack 프레임이 종료된다면 인스턴스는 삭제됨.
 
 
 
 우리는 주로 구조체를 사용할 것이다.
 왜냐하면, 구조체가 클래스보다 더 가볍게 사용이 가능.
 클래스는 Heap의 메모리까지 사용하게 되어서 메모리를 조금 더 차지한다.
 
 구조체와 클래스는 위의 개념을 제외하고는 거의 동일한 개념이라
 동시에 공부를 진행하는 것이 좋다.
 
 */






// 3) 클래스와 구조체의 메모리

// [ 클래스 ]

class Drink {
    var name = "음료수"
}



var drink1 = Drink()

drink1.name



// drink1이라는 객체를 drink2에 복사
var drink2 = drink1

drink1.name
drink2.name

// drink2 객체의 속성을 바꾸면,
drink2.name = "콜라"

// drink1 객체의 속성도 같이 바꿔진다.
drink1.name
drink2.name


// 이는 class는 stack에서 객체를 복사할 때,
// 새로운 객체를 생성하는 것이 아닌 원래 객체의 주소를 복사하는 것이기 때문에
// drink1 객체와 drink2 객체가 가리키는 객체는 동일한 것이다.

// [ 구조체 ]

struct Water {
    var name = "물"
}



var water1 = Water()

water1.name

// water1이라는 인스턴스를 water2라는 변수에 복사
var water2 = water1

// water2 인스턴스의 속성을 바꾸면,
water2.name = "삼다수"


// water1 인스턴스의 속성은 바뀌지 않고, water2 인스턴스의 속성만이 바뀐다.
water1.name
water2.name

// 이는 클래스와 달리 구조체는 stack에서 자체 인스턴스를 생성하기 때문에
// 인스턴스를 복사하는 과정에 새로운 인스턴스가 생성이된다.
// water1의 인스턴스와 water2의 인스턴스는 다른 인스턴스이다.







// 4) 클래스와 구조체에서 var과 let키워드

class PersonClass {
    var name = "사람"
    var age = 0
}



struct AnimalStruct {
    var name = "동물"
    var age = 0
}


// 각각의 객체와 인스턴스를 let이라는 키워드로 생성했을 때,
let pclass = PersonClass()
let astruct = AnimalStruct()


// 클래스 객체의 속성은 var로 입력이 되어 변경이 가능하지만,
pclass.name = "사람1"
pclass.name


// 구조체 인스턴스의 속성은 let로 입력이 되어 변경이 불가능하다.
//astruct.name = "동물1"
astruct.name


// 저장 방식과 관련된 것으로 클래스의 객체를 let으로 선언하더라도
// 이는 클래스의 객체의 주소값을 바꿀 수 없다는 뜻이지
// 클래스의 객체내의 속성값이 let으로 선언된다는 것이 아니다.
// 하지만, 구조체는 인스턴스 자체가 let으로 선언이 되어,
// 구조체의 인스턴스내의 속성값이 모두 let으로 선언되기 때문에 변경이 불가능하다.






// *** 접문법이란? 점을 찍어서 멤버 내의 접근을 의미한다.
// 이를 다른 말로, 명시적 멤버 표현식 (explicit member expresstion)이라고 한다.


// 클래스, 구조체의 인스턴스의 멤버에 접근 ( 이때, 멤버는 속성과 메서드를 둘다 포함 )

aBird.fly()


Int.random(in: 1...10)






/**============================================
관습적으로 클래스, 구조체 선언할때 모두 1) 속성 2) 메서드 순서대로 작성
===============================================**/



// 주의점 - (참고) 클래스 내부에는 직접 메서드(함수) 실행문이 올 수 없다. ⭐️


class Baejihae {
    
    var name = "배지해"
    var age = 23
    var height = 160.0
    
    func sit(){
        print("앉았습니다")
    }
    
    func downAndUp(){
        // 메서드의 실행문이 다른 메서드 안에는 위치 가능
        sit()
        print("일어섰습니다.")
    }
    
    // sit() <- 이렇게 직접 메서드 실행문은 절대 절대 올 수 없음.
    
}
