import UIKit

/** 3) 서브스크립트 (Subscripts) - 배열 딕셔너리에서 이미 경험 **/

/**=============================================
 
 서브스크립트란?
 : 대괄호를 이용해 접근이 가능하도록 만든 문법
 
 - 배열
    array[ 인덱스 ]
 
 - 딕셔너리
    dictionary[ 키 ]
 
 ===============================================**/


var array = ["Apple", "Swift", "iOS", "Hello"]

array[0]
array[1]

// 내부적으로 대괄호를 사용하면 어떤 값을 리턴하도록 구현이 되어 있어서 가능한 일

// 📝 note.
// 서브스크립트는 특별한 형태의 메서드


class SomeData {
    var dates = ["Apple", "Swift", "iOS", "Hello"]
    
    // 서브 스크립트 함수 - func 생략
    // 1) 함수와 동일한 형태이지만, 이름은 subscript
    // 2) get/set은 계산 속성에서의 형태와 비슷
    subscript(index: Int) -> String {
        get {
            return dates[index]
        }
        set {
            // 파라미터를 넣고, 파라미터로 선언 가능 ( 계산 속성의 setter와 동일 )
            dates[index] = newValue
        }
    }
}


// 서브 스크립트가 없다면, 클래스의 객체에 속한 배열에 바로 접근이 불가능
var data = SomeData()
data.dates[0]

data[0]
data[0] = "AAA"

// 서브 스크립트는 파라미터 생략 불가 ( 값이 반드시 필요 )
// 리턴형도 생략 불가 ( 저장된 값의 타입 명시 필요 )
// 읽기 전용 ( read-only )으로 선언 가능
// set 블록은 선택적/ 쓰기 전용으로는 불가능

Int.random(in: 1...10)



/*:
 ---
 * 서브스크립트 사용 예시 - 대괄호 형태로 사용하는 메서드이다.
 ---
*/

struct TimesTable {
    let multiplier: Int = 3
    
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}


let threeTimesTable = TimesTable()

threeTimesTable[2]
threeTimesTable[5]


//============================================


struct Matrix {
    // 2차원 배열
    var data = [[ 1, 2, 3], [ 4, 5, 6], [ 7, 8, 9]]
    
    subscript(row: Int, column: Int) -> Int? {
        if row >= 3 || column >= 3 {
            return nil
        }
        return data[row][column]
    }
}

// 2개의 파라미터를 받는 서브 스크립트 구현도 가능

var mat = Matrix()

print(mat[0, 1]!)

//====================================================

/* 타입 서브스크립트(Type Subscript) - 클래스, 구조체, (열거형) */

// 열거형의 원시값
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    
    static subscript(n: Int) -> Planet { // Self
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
print(mars)
