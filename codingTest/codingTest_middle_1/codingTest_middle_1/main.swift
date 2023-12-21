//
//  main.swift
//  codingTest_middle_1
//
//  Created by 배지해 on 12/15/23.
//

import Foundation

func solution(_ s:String) -> Int{
    
//    var array: [Character] = Array(s.map({$0}))
//    var collect = [Int](repeating: 0, count: array.count)
//    var count = 0
//    if array.count % 2 != 0{
//        return 0
//    }
//    for i in 0...array.count-2{
//        if collect[i] == 0 {
//            var k = i+1
//            while k <= array.count-1{
//                if collect[k] == 0 && array[i] == array[k]{
//                    count += 1
//                    collect[i] = 1
//                    collect[k] = 1
//                    break
//                }else {
//                    k += 2
//                }
//            }
//            if collect[i] == 0 {
//                return 0
//            }
//        }
//    }
//    if Int(array.count/2) == count{
//        return 1
//    }else{
//        return 0
//    }
    
    // 스택으로 풀기
    var array: [Character] = Array(s.map({$0}))
    var collect : [Character] = []
    
    if array.count % 2 != 0{
        return 0
    }
    
    return 0
}

print(solution("baabaa"))
print(solution("cdcd"))
