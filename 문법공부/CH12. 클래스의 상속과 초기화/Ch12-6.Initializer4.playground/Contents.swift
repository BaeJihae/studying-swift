import UIKit

/*:
 ## 클래스의 지정, 편의 생성자 상속의 예외사항
 * 클래스의 생성자 자동 상속 규칙
 ---
 */

//:> 지정 생성자 자동 상속의 예외 사항 -> 저장속성의 기본값 설정
/**========================================
 
 - 새 저장 속성이 아예 없거나, 모든 저장 속성이 기본값이 있는 경우
    ( 실패 가능성 배제 )
 
 ==> 슈퍼 클래스의 지정 생성자 모두 자동 상속
     ( 단, 하위에서 어떠한 재정의도 하지 않아야 함. )
 
 ========================================**/

//:> 편의 생성자 자동 상속의 예외 사항 -> 상위 모든 지정 생성자를 상속했을 경우

/**===================================
 
 1) 상위의 지정 생성자를 자동으로 상속했을 경우엔,
 자동으로 상위의 편의 생성자를 자동으로 상속한다.
 
 2) 상위 지정생성자를 모든 재정의해서 구현했을 경우
    ( 실패 가능성 배제 )
 
 ==> 따라서 모든 지정 생성자를 상속하는 상황이면,
    편의 생성자도 자동으로 상속된다.
 
 ------------------------------------**/


/*:
 ---
 * 애플 공식 문서의 예시
 ---
 */

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

// ⭐️ Food 클래스의 생성자
// 지정 생성자
// init(name: String)
// 편의 생성자
// init()

let mysteryMeat = Food()

print("mysteryMeat's name is \(mysteryMeat.name)")
// mysteryMeat's name is "[Unnamed]"

class RecipeIngredient: Food {
    // 새로운 지정 생성자
    var quantity: Int
    
    // RecipeIngredient의 지정 생성자
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    // Food의 지정 생성자 => 편의 생성자로 상속
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
    
    // 자동 상속
//    override convenience init() {
//        self.init(name: "[Unnamed]")
//    }
    
}

// ⭐️ RecipeIngredient 클래스의 생성자
// 지정 생성자
// init(name: String, quantity: Int)
// 편의 생성자 (상위의 지정 생성자를 상속)
// init(name: String)
// (자동 상속) init()

// -> 상위의 모든 상위 생성자를 모두 재정의
// ==> 상위의 편의 생성자가 자동으로 상속됨.

let oneMysteryItem = RecipeIngredient()
oneMysteryItem.quantity
oneMysteryItem.name
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)


// 자동 상속이 되는 이유는?
// 상위 클래스에서 편의 생성자는 현재의 지정 생성자를 호출하게 되는데,
// 상위클래스의 모든 지정생성자를 재정의를 했다면,
// 하위클래스에서는 해당 편의 생성자를 호출하게 되더라도,
// 그 편의 생성자가 호출하게 되는 지정 생성자가 다 있기 때문에
// 그 지정 생성자가 다시 하위 클래스의 지정 생성자를 호출할 거기 때문에
// 문제가 없으므로 자동 상속된다.



class ShoppingListItem: RecipeIngredient {
    
    // 새로운 ShoppingListItem 의 저장 속성
    var purchased = false
    
    // 새로운 계산 속성
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
    
    // 위의 새로운 저장 속성과 계산 속성 모두 기본값이 정의가 되어있기 때문에
    // 상위클래스의 모든 지정 생성자가 자동으로 상속
    // 모든 지정 생성자가 상속되니 자동으로 상위 편의 생성자도 상속
    // init(name: String, quantity: Int) {}
    // convenience init(name: String) {}
    // convenience init() {}
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}
