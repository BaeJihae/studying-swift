import UIKit


//func multiParamFunction(a: Int, b: Int, closure: (Int) -> (Void)){
//    let c = a + b
//    closure(c)
//}
//
//multiParamFunction(a: 5, b: 7, closure: { c in
//    print(c)
//})
//
//// 엔터치면 후행 클로저 문법으로 자동으로 바뀜
//multiParamFunction(a: 3, b: 4) { c in
//    print(c)
//}
//
//// 아규먼트 생략 가능
//multiParamFunction(a: 5, b: 7) {print($0)}
//
//let closerType1 = { (param: Int) -> (Bool) in
//    return param % 2 == 0
//}
//
//let closerType2 = { (param) in
//    return param % 2 == 0
//}
//
//let closerType3 = { $0 % 2 == 0 }
//
//
//let closerType4 = { (a: Int, b: Int) -> (Int) in
//    return a*b
//}
//
//let closerType5 = { (a: Int, b: Int) in
//    a*b
//}
//
//let closerType6: (Int, Int) -> (Int) = { (a, b) in
//    a*b
//}
//
//let closerType7: (Int, Int) -> (Int) = { $0 * $1 }



array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

//홀수만 제곱해서 다 더한 값은?


var aaa = array.filter{ $0 % 2 == 1 }.map{ $0 * $0 }.reduce(0){ $0 + $1 }

print(aaa)
