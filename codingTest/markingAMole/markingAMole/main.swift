//
//  main.swift
//  markingAMole
//
//  Created by 배지해 on 2023/07/03.
//

import Foundation
func circleMax(_ x: Int, _ d: Int) -> Double{
    // 원 방정식 x^2 + y^2 <= d^2
    // y^2 <= d^2 - x^2
    return sqrt(pow(Double(d), 2.0) - pow(Double(x), 2.0))
}

func solution(_ k:Int, _ d:Int) -> Int64 {
    var count = 0
    for x in stride(from: 0, through: d, by: k){
        count += Int(circleMax(x, d))/k + 1
    }
    return Int64(count)
}

print(solution(2, 4))
