import UIKit

/**==================================================================
  - 아래의 코드 예제에서, Bclass는 Aclass를 상속하고 있습니다. Bclass의 저장속성인
    z를 고려해서, Bclass의 지정생성자를 한개이상 구현하고, 상위(Aclass)의 지정생성자
    (init(x: Int, y: Int))를 편의생성자로 재정의 해보세요.
    (자유롭게 구현해보세요.)
 ===================================================================**/


class Aclass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    convenience init() {
        self.init(x: 0, y: 0)
    }
}



// 아래의 주석을 제거하고 코드를 구현

class Bclass: Aclass {

    var z: Int

    // 이 부분에 지정생성자 및 편의 생성자(상위의 지정생성자를 재정의해서) 구현
    
    // 상위 지정생성자 -> 편의생성자로 선언
    override convenience init(x: Int, y: Int) {
        self.init(x: x, y: y, z: 0)
    }
    
    // 편의 생성자
    convenience init(z: Int){
        self.init(x: 0, y: 0, z: z)
    }
    
    // 지정 생성자
    init(x: Int, y: Int, z: Int) {
        // 아래서 부터 생성하기 때문에, 현재의 저장 속성을 먼저 정의하고 슈퍼 클래스의 저장 속성을 정의해야함.
        // self.z 가 먼저 나오고 -> super.init이 나와야함!
        self.z = z
        super.init(x: x, y: y)
    }
    
    // 상위의 지정 생성자를 다 구현했으니 상위 편의 생성자 자동 생성
//    convenience init() {}

}







