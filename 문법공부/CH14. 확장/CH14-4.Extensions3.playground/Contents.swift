import UIKit

/*:
## 3) 멤버의 확장(생성자)
 * 3. 생성자의 확장
 ---
 */
//:> 클래스 - 편의 생성자만 구현 가능 / 구조체(값타입) - 지정생성자 형태로도 (자유롭게) 생성자 구현 가능
/**=========================================================================
  [클래스]
 - 편의 생성자만 추가 가능 (즉, 본체의 지정생성자를 호출하는 방법으로만 구현 가능) ⭐️
 - 지정생성자 추가 불가 / 소멸자 추가 불가 (항상 본래의 클래스에서 정의해야 함)

 
  [구조체]
 - 구조체는 (원래) 편의 생성자가 존재하지 않고, 상속과 관련이 없기 때문에
   지정생성자의 형태로도 (자유롭게) 생성자 구현 가능 ⭐️
   (1) (편의 생성자와 비슷한) 생성자를 추가하여 본체의 지정 생성자를 호출하는 방법으로도 구현 가능하고
   (2) 새롭게 지정생성자 형태로 구현하는 것도 가능
 
  [구조체 참고 사항]
 - (본체) 직접 생성자 구현하면, 기본 생성자 init() /멤버와이즈 생성자 제공 안되는 것이 원칙
 
 - (예외) (본체) 모든 저장속성에 기본값제공 + (본체에 직접) 생성자를 구현하지 않았다면, 확장에서는 괜찮음
 - (즉, 확장에서 생성자를 구현해도, 본체에는 여전히 기본 생성자/멤버와이즈 생성자가 자동 제공
    되고 본체의 기본 생성자/멤버와이즈 생성자 호출하는 방식으로의 구현도 가능)
=========================================================================**/



/*:
---
* 구조체 - 생성자 확장의 예시
---
*/
// 포인트 구조체, 사이즈 구조체

struct Point {
    var x = 0.0, y = 0.0
    
    //init(x: Double, y: Double)
    
    //init()
}



struct Size {
    var width = 0.0, height = 0.0
}



// Rect구조체

struct Rect {     // 기본값 제공/생성자 구현안함  ===> 기본 생성자 / 멤버와이즈 생성자가 자동 제공 중
    var origin = Point()
    var size = Size()
}


let defaultRect = Rect()    // 기본생성자

//Rect(origin: Point(x: <#T##Double#>, y: <#T##Double#>), size: Size(width: <#T##Double#>, height: <#T##Double#>))

let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
                          size: Size(width: 5.0, height: 5.0))    // 멤버와이즈 생성자



extension Rect {
    // 센터값으로 Rect 생성하는 생성자 만들기
    // 예외적인 경우 (저장속성에 기본값 + 본체에 생성자 구현 안한 경우, 여전히 기본생성자/멤버와이즈 생성자 제공)
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        
        // (1) 본체의 멤버와이즈 생성자 호출 방식으로 구현 가능
        self.init(origin: Point(x: originX, y: originY), size: size)
        
        // (2) 직접 값을 설정하는 방식으로도 구현 가능
        //self.origin = Point(x: originX, y: originY)
        //self.size = size
    }
}


// 새로 추가한 생성자로 인스턴스 생성해보기

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))




/*:
---
* 클래스 - 생성자 확장의 예시
---
*/
// UIColor 기본 생성자
var color = UIColor(red: 0.3, green: 0.5, blue: 0.4, alpha: 1)
    


extension UIColor {      // 익스텐션 + 편의생성자 조합
    
    convenience init(color: CGFloat) {   // Float   / Double
        self.init(red: color/255, green: color/255, blue: color/255, alpha: 1)
    }

}


// 일단 아주 쉽게 객체 생성하는 방법을 제공 가능해짐

UIColor(color: 1)
//UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)


