//
//  main.swift
//  SpiralArrangementOfIntegers
//
//  Created by 배지해 on 2023/07/02.
//

import Foundation

func solution(_ n:Int) -> [[Int]] {
    
    var xAnswer:[Int] = [0,0,0,0]
    var yAnswer:[Int]
    
    for i in Int.Range(0...3) {
        yAnswer[i] = xAnswer
    }
    
    print(yAnswer)
    
    return []
}

func main(){
    solution(4)
}
