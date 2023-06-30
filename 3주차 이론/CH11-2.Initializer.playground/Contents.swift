import UIKit


/***

 생성자에서 파라미터와 인스턴스의 속성이 같을때를 구분짓기 위해서
 self. 라는 자신의 데이터값을 가리키는 키워드를 사용한다.

 ***/

class Dog1 {
    
    var name:String
    var weight:Double
    
    // init는 initializer의 약자로 생성자의 줄임말이다.
    // 생성자
    init(name:String, weight:Double){
        self.name = name
        self.weight = weight
    }
    
    func sit(){
        print("\(self.name)가 앉았습니다.")
    }
    
    func eat(){
        print("\(self.name)가 먹었습니다.")
    }
}


// 인스턴스의 속성이 초기화 되지 않았을 경우엔, 아래와 같이 인스턴스를 생성하려고 하면
// 인스턴스의 모든 속성이 초기화 되지 않아 오류가 난다.
// var choco = Dog()

var choco = Dog1(name: "초코", weight: 7)

choco.name
choco.weight
choco.sit()
choco.eat()

// 원래는 아래와 같이 생성자를 사용하는 게 맞지만, 생략이 가능하다.
var bori = Dog1.init(name: "보리", weight: 12)


// 즉, 구조체와 클래스 모두 모든 저장 속성을 초기화 해야하고,
// 생성자의 실행 종료 시점에 모든 속성이 초기화가 되어 있어야 컴파일 오류가 나지 않는다.


// 클래스, 구조체, 열거형 모두 실제 데이터(속성), 동작(메서드)를 사용하기 위해서는 초기화가 필수이다.


//*** note: self 키워드는 클래스/구조체 내에서 해당 인스턴스(자기자신)를 가르킨다.

/*초기화의 의미 - 속성이 옵셔널 타입인 경우*/

class Dog2 {
    
    var name:String?
    var weight:Double
    
    //생성자
    init(weight:Double){
        //self.name = name
        self.weight = weight
    }
    
    func sit(){
        print("\(self.name)가 앉았습니다.")
    }
    
    func eat(){
        print("\(self.name)가 먹었습니다.")
    }
}

var jaerong = Dog2(weight: 12)


// name이라는 인스턴스의 속성을 옵셔널 타입으로 지정한다면,
// 초기화를 시키지 않아도, 오류가 나지 않고, nil 이라고 출력이된다.
jaerong.name
jaerong.weight


class Dog3 {
    
    var name:String?
    var weight:Double
    
    //생성자
    // init(name: String = "초롱이", weight:Double) 이런 식으로도 초기화가 가능!
    init(name: String, weight:Double){
        self.name = name
        self.weight = weight
    }
    
    func sit(){
        print("\(self.name)가 앉았습니다.")
    }
    
    func eat(){
        print("\(self.name)가 먹었습니다.")
    }
}

var chorong = Dog3(name: "초롱이", weight: 15)

// 옵셔널 타입으로 선언하였을 때,
// 인스턴스 속성이 초기화가 되더라도 출력을 하게되면, 옵셔널 타입으로 출력이 된다.
// 이는 name이라는 인스턴스 속성 자체가 string? 이기 때문이다.
print(chorong.name)
chorong.weight

// 그럴땐, if let 바인딩이나 guard let 바인딩을 사용하여, 옵셔널 타입을 벗겨주면 된다.
if let name = chorong.name {
    print(name)
}




/*Identity Operators(식별연산자)*/

// ===과 !== 두 개의 참조가 같은 인스턴스를 가리키고 있는지 확인이 가능하다.
print(chorong === jaerong)
print(chorong !== jaerong)
