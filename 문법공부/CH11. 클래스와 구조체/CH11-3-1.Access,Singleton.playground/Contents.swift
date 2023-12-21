import UIKit



/*:

 
 ## 참고) 접근제어의 개념
 
---
*/
class SomeClass {
    // private는 은닉화를 시킬 수 있다.
    private var name = "이름"
    
    func nameChange(name: String) {
        self.name = name
    }
}

var s = SomeClass()

// s.name -> 존재하지 않음

s.nameChange(name: "홍길동")


/*:

* 접근제어가 필요한 이유
---
 */
// * 애플이 자신들이 원하는 코드를 감출 수 있음.
// * 코드의 영역을 분리시켜, 효율적으로 관리 가능
// * 컴파일 시간이 줄어듬 ( 컴파일러가, 해당 변수가 어느 범위에서만 쓰이는지를 인지 가능 )



/*:
 
 ## 참고) 싱글톤(Singleton) 패턴
 * 메모리 상에 유일하게 1개만 존재하는 객체 실체
 ---
 */
// 자기 자신의 객체를 타입 속성으로 생성하여 전역변수에 할당
// static let 이름 = 객체생성()

class DataManager {
    
    // 타입 프로퍼티로 객체 생성
    static let shared = DataManager()
    
    // 저장 프로퍼티
    var userInfolde = 12345
    
    // 인스턴스 메서드
    func dataDownload() {
      // 함수 내용
    }
}

//:> 변수로 접근하는 순간 lazy하게 동작하여, 메모리(데이터 영역)에 올라감
// 싱글톤 패턴은 lazy 속성과 비슷하게 작용해
// 코드에서 접근하기 전까지는 메모리에 할당하지 않지만,
// 밑처럼 코드에 접근하는 순간 메모리를 할당한다.
var a = DataManager.shared



// 새로운 객체를 만들어서 할당하더라도,
// 이 객체는 새로운 객체를 만들어내는 것이 아닌
// 위의 a와 같은 객체를 가르킨다.
var b = DataManager.shared


a.userInfolde
b.userInfolde = 22222

// a 와 b는 같은 객체를 가르키고 있어서
// b 객체의 속성을 바꾸면, a 객체의 속성도 같이 바뀌게 된다.
a.userInfolde
b.userInfolde
DataManager.shared.userInfolde

// 하지만, 밑의 코드처럼 .shared가 아닌
// 일반적으로 클래스의 객체를 생성한다면, 위의 a, b가 가리키는 객체가 아닌
// 새로운 객체로 할당이 가능하다.
var c = DataManager()


// 싱글톤은 유일하게 한 개만 생성하는 객체를 필요한 경우 사용하는 것이므로
// 위의 객체 c의 경우를 막을 수 있다.

class DataManager2 {
    
    // 타입 프로퍼티로 객체 생성
    static let shared = DataManager2()
    
    // 저장 프로퍼티
    var userInfolde = 12345
    
    // 객체 생성을 막기 위해 생성자를 은닉화 시킴
    private init() {}
    
    // 인스턴스 메서드
    func dataDownload() {
      // 함수 내용
    }
}

//:> private init() {} 을 사용하면 또다른 새로운 객체 생성을 막을 수 있다.


/*:
 ---
 * 실제 사용 예시
 ---
 */
// 앱을 실행하는 동안, 하나의 유일한 객체만 생성되어서, 해당 부분을 관리

let screen = UIScreen.main    // 화면
let userDefaults = UserDefaults.standard    // 한번생성된 후, 계속 메모리에 남음!!!
let application = UIApplication.shared   // 앱
let fileManager = FileManager.default    // 파일
let notification = NotificationCenter.default   // 노티피케이션(특정 상황, 시점을 알려줌)

