//
//  main.swift
//  PlusPolynomial
//
//  Created by 배지해 on 2023/07/06.
//

import Foundation

//"3x + 7 + x" = "4x + 7"

func solution(_ polynomial:String) -> String {
    var pA = Array(polynomial.components(separatedBy: " "))
    // 일차항, 상수항
    var firstnum = 0, lastnum = 0
    // 답
    var answer = ""
    
    for str in pA{
        if str.contains("x") {
            if str.prefix(1) == "x"{
                firstnum += 1
            }else {
                if let fir = Int(str.prefix(1)){ firstnum += fir }
            }
        }else {
            if let a = Int(str) { lastnum += a }
        }
    }
    
    if firstnum > 1 {
        answer.append(String(firstnum)+"x")
    }else if firstnum == 1{
        answer.append("x")
    }
    if firstnum != 0 && lastnum > 0{
        answer.append(" + ")
    }
    if lastnum != 0 {
        answer.append(String(lastnum))
    }
    return answer
}

print(solution("3x + 7 + x"))
