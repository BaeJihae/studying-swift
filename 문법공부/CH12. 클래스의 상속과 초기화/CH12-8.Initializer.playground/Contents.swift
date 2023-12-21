import UIKit

/*:
 ## 실패가능 생성자
 * 실패가능 생성자 (Failable Initializers) - init? (파라미터)
 ---
*/

/**=================================================
 
 - 실패가능 생성자란? 인스턴스 생성에 실패할 가능성을 가진 생성자
   [ 생성자에 ?를 붙여서 init?(파라미터)로 정의 ]
 
 - 하지만, 동일한 파라미터를 가진 생성자는 유일해야한다.
   (오버로딩으로 실패가능 / 불가능을 구분 짓지 못함)
 
 -> 생성자에 의해 아예 에러가 나거나 앱이 완전히 꺼지는 가능성보다
    실패가능 생성자를 정의해 그에 맞는 예외 처리를 하는 것이 더 올바르다.
 
 ================================================**/

struct Animal{
    let species: String
    
    // 실패가능 생성자
    init?(species: String) {
        // 생성자 내에서 실패 가능성이 있는 부분에서 nil을 리턴하자 (문법적 약속)
        if species.isEmpty { return nil }
        self.species = species
    }
    
}

let a = Animal(species: "")
print(a)

let b = Animal(species: "Giraffe")
print(b!.species)

// 엄밀히 말하면 생성자의 역할은 값을 반환하는 것이 아닌,
// 초기화가 끝날 때까지 모든 저장 속성이 값을 가지도록 ( 초기화가 되도록 )하는 것이다.

// 초기화 성공을 나타 내기 위해 return 키워드를 사용하지 않는다. (문법적 약속)

/*:
 ---
 * 열거형의 실패가능 생성자 활용
 ---
 */
enum TemperatureUnit {
    case kelvin
    case celsius
    case fahrenheit
    
    init? (symbol: Character){
        switch symbol {
        case "K":
            self = TemperatureUnit.kelvin
        case "C":
            self = TemperatureUnit.celsius
        case "F":
            self = TemperatureUnit.fahrenheit
        default:
            return nil
        }
    }
}

let c = TemperatureUnit.celsius     // TemperatureUnit()

let f = TemperatureUnit.init(symbol: "W")



// 열거형에서는 모든 저장 속성에 원시값을 설정하는 것과 실패가능 생성자로 생성하는 것이 유사하다.

enum TemperatureUnit1: Character {
    case kelvin = "K"
    case celsius = "C"
    case fahrenheit = "F"
}

let f1: TemperatureUnit1? = TemperatureUnit1(rawValue: "F")

let u: TemperatureUnit1? = TemperatureUnit1(rawValue: "U")

/*:
 ---
 * 1) 초기화 실패의 전달 (호출 관계)
 ---
 */


/**=======================================================
 ⭐️ 실패 불가능 생성자는 다른 실패 가능 생성자를 호출 불가능이다.
 why? 실패 불가능 생성자는 실패 가능 생성자에 포함 되어 있기 때문에,
      작은 범위에서 큰 범위의 경우를 가리킬 수 없다.
 
 [ 동일 단계 ] - 델리게이트 어크로스
 - 실패 가능 -> 실패 불가능 (호출/위임) 가능!
 - 실패 불가능 -> 실패 가능 (호출/위임) 불가능!
 
 [ 상속 관계 ] - 델리게이트 업
 - (상위) 실패 가능 <=== (하위) 실패 불가능 (호출 / 위임) 불가능!
 - (상위) 실패 불가능 <=== (하위) 실패 가능 (호출 / 위임) 가능!
 
 - 두 경우 모두 초기화 실패를 유발하는 다른 생성자에 위임하면
   전체 초기화 프로세스가 즉시 실패하고 더 이상 초기화 코드가 실행되지 않음
 
 ======================================================**/


// 상속 관계에서 호출 예제

class Product {
    let name: String
    
    // 실패가능 생성자
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}


class CartItem: Product {
    let quantity: Int
    
    // 실패가능 생성자 - 재정의 X ( 상위와 파라미터가 다름 )
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        // 실패가능 생성자 - 실패가능 생성자 호출 가능
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
// Prints "Item: sock, quantity: 2"

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}
// Prints "Unable to initialize zero shirts"

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}
// Prints "Unable to initialize one unnamed product"
/*:
 ---
 * 2) (상속관계에서) 재정의 하기
 ---
 */
/**================================
 - (상위) init? -> (하위) init  (O)
 - (상위) init  -> (하위) init? (X)
 ===============================**/

class Document {
    var name: String?
    
    // 실패 불가능 생성자
    init() {}
    
    // 실패 가능 생성자
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    // 실패 불가능 생성자 -> 재정의 가능
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    // 실패 가능 생성자 -> 재정의 가능
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

/*:
 ---
 * 실패가능 생성자를 init!(파라미터)로 정의하기
 ---
 */
// init!은 init?과 유사하게 취급하면 된다.

