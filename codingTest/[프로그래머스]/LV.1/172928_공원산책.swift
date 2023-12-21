//
//  main.swift
//  ParkRunning
//
//  Created by 배지해 on 2023/07/28.
//

import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    
    // 현재 위치를 파악하는 좌표 변수
    var (h, w) :(Int, Int) = (0, 0)
    var count = 0
    
    // park 이중 배열로 나타내기
    
    // park 이중 배열로 나타낼 변수
    var newPark: [[String]] = []
    
    for element in park{
        var ap: [String] = element.map { String($0) }
        
        // 현재위치 파악하기
        if let x = ap.firstIndex(of: "S"){
            ( h, w) = ( count, Int(x))
        }
        
        newPark.append(ap)
        count += 1
    }
    
    // 동서남북으로 이동할 배열 만들기
    let op = ["N", "S", "W", "E"]
    let move = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    
    for order in routes{
        // routes 배열을 위치와 칸 수로 구분하기
        let a = (order.components(separatedBy: " ").map {$0})
        let ( currentOp, n) = (a[0], Int(a[1])!)
        let index = op.firstIndex(of: currentOp)!
        
        // 이동할 변수
        var (hx, wx) = (h, w)
        var c = 0
        for _ in 1...n{
            hx += (move[index][0])
            wx += (move[index][1])
            // 1. 공원 벗어나는지 확인
            // 2. 장애물 만나는지 확인
            if hx >= 0 && hx < newPark.count && wx >= 0 && wx < newPark[0].count && newPark[hx][wx] != "X"{
                c += 1
            }
            if c == n {
                ( h, w ) = ( hx, wx )
            }
        }
        
    }
    return [h, w]
}

print(solution(["OOX", "OXO", "OOS"], ["E 2", "E 3", "N 1"]))
//print(solution(["SOO","OXX","OOO"], ["E 2","S 2","W 1"]))
//print(solution(["OSO","OOO","OXO","OOO"], ["E 2","S 3","W 1"]))
