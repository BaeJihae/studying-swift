//
//  main.swift
//  codingTest_middle_1
//
//  Created by 배지해 on 12/15/23.
//

import Foundation

func solution(_ s:String) -> Int{
    
    // 스택으로 풀기
    var array: [Character] = Array(s.map({$0}))
    var collect : [Character] = []
    
    if array.count % 2 != 0{
        return 0
    }
    for i in array{
        if collect == [] || collect.last != i {
            collect.append(i)
        }else{
            collect.removeLast()
        }
    }
    if collect == [] {
        return 1
    }else{
        return 0
    }
}

print(solution("baabaa"))
print(solution("cdcd"))
