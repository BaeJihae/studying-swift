//
//  main.swift
//  SpiralArrangementOfIntegers
//
//  Created by 배지해 on 2023/07/02.
//

import Foundation

func solution(_ n:Int) -> [[Int]] {
    
    var answer : [[Int]] = Array(repeating: Array(repeating: 0,count:n ), count: n)
    let move : [[Int]] = [[0,1], [1,0], [0,-1], [-1,0]]
    
    var x = 0, y = 0
    var realX = 0, realY = 0
    var i = 0
    
    for k in 1...Int( pow( Double(n), 2.0) ){
        
        answer[realX][realY] = k
        
        x = realX + move[i][0]
        y = realY + move[i][1]
        
        if x < 0 || x >= n || y < 0 || y >= n || answer[x][y] != 0 {
            i = (i+1)%4
            realX += move[i][0]
            realY += move[i][1]
            continue
        }
        
        realX = x; realY = y
        
    }
    return answer
}

print(solution(5))
