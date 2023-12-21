import UIKit


/*:
## 2) 멤버의 확장(메서드)
 * 2-1. (타입)메서드의 확장
 ---
 */
// 애플이 만든 타입메서드 예시

Int.random(in: 1...100)


extension Int {
    static func printNumbersFrom1to5() {
        for i in 1...5 {
            print(i)
        }
    }
}


// 항상 1부터 5까지를 출력

Int.printNumbersFrom1to5()



/*:
---
* 2-2. (인스턴스)메서드의 확장
---
*/
// Int타입에 특정 프린트 구문 확장해보기

extension String {
    func printHelloRepetitions(of times: Int) {
        for _ in 0..<times {
            print("Hello \(self)!")
        }
    }
}



"Steve".printHelloRepetitions(of: 4)
//"Swift".printHelloRepetitions(of: 5)
    

//Hello Steve!
//Hello Steve!
//Hello Steve!
//Hello Steve!




/*:
---
* mutating 인스턴스 메서드의 확장
---
*/
//:> 구조체(열거형)에서, 자신의 속성을 변경하는 메서드는 mutating키워드 필요

// 제곱하는 메서드 만들어 보기

extension Int {
    mutating func square() {    // 기존 메서드와 동일하게, mutating 키워드 필요
        self = self * self
    }
}



var someInt = 3
someInt.square()    // 9


