import UIKit


/*:
## 1) 멤버의 확장(계산 속성)
* 1-1. (타입)계산 속성의 확장
---
*/
// (타입) 계산 속성 또는 (인스턴스) 계산 속성 확장 가능
// (저장된 속성을 추가하거나 기존 속성에 속성 관찰자를 추가 할 수는 없음)


extension Double {
    static var zero: Double { return 0.0 }
}

Double.zero



/*:
 ---
 * 1-2. (인스턴스)계산 속성의 확장
 ---
 */
// 인스턴스의 (읽기전용) 계산 속성을 기존의 애플이 만든 Double 타입에 추가 하는 예제


// 자신의 단위를 입력하여 ==> 미터 기준으로 바꾸는 예제

extension Double {
    var km: Double { return self * 1_000.0 }   // 인스턴스 자신에 1000 곱하기
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}


let oneInch = 25.4.mm
print("1인치는 \(oneInch) 미터")       // 1인치는 0.0254 미터"


let threeFeet = 3.ft
print("3피트는 \(threeFeet) 미터")     // 3피트는 0.914399970739201 미터"




// 인스턴스자체에 즉, Double의 리터럴값에 .(점)문법을 사용하여 거리 변환을 수행하도록 만듦


// Double 값 1.0  ===> "1 미터"를 나타내는 것으로 간주됨
// m 계산 속성이 self를 반환 (1.m 표현식은 Double값 1.0을 계산하는 것임)

// 1 킬로미터는 Double 값에 1_000.00을 곱하여 "미터로 변환"
// ft 계산 속성은 Double 값을 3.28084로 나누어 피트에서 "미터로 변환"



let aMarathon = 42.km + 195.m
print("마라톤은 \(aMarathon) 미터의 길이임")        // 마라톤은 42195.0 미터의 길이임"





extension Int {
    var squared: Int {
        return self * self
    }
}


func squared(num: Int) -> Int {     // 이런식으로 함수를 만드는 것보다 훨씬 간단하고, 더 간결하게 만들 수 있음
    return num * num
}


Int(123).squared
123.squared


squared(num: 123)
