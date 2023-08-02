import UIKit

/*:
 ## 필수 생성자
 * 필수 생성자(Required Initializers)
 ---
 */

class Aclass {
    
    var x: Int
    
    required init(x: Int){
        self.x = x
    }
}

// 클래스 생성자 앞에 required 키워드를 사용하면
// 하위클래스에서 반드시 해당 필수 생성자를 구현해야함.
// 이때, override(재정의) 키워드를 쓸 필요가 없음.



//:> 필수 생성자 자동 상속 조건 : 다른 지정 생성자를 구현안할시
// 다른 지정 생성자를 구현하지 않을 시
// 필수 생성자가 자동으로 상속된다.

class Cclass: Aclass {
    var y: Int = 0
    
    // required init(x: Int) {}
}

// 만약 Cclass에서 init을 생성했다면,
// required init(x: Int)을 반드시 호출해야함.


/*:
 ---
 * 필수 생성자 사용 예시 (UIView)
 ---
 */
// ⭐️ UIView에는 필수 생성자가 있음

class AView: UIView {
//    required init?(coder: NSCoder) {         // 구현을 안해도 자동상속
//        fatalError("init(coder:) has not been implemented")
//    }
}


class BView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
