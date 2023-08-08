//
//  main.swift
//  AFruitSeller
//
//  Created by 배지해 on 2023/08/07.
//

import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    
    // 사과의 품질을 내림차순으로 정리
    var nScore = score
    nScore = nScore.sorted(by: { $0 > $1 })
    
    // 상자의 개수
    var n: Int = nScore.count/m
    
    // 가격
    var price: Int = 0
    
    // 상자당 가격 매기기
    if n>0 {
        for i in 1...n{
            price += nScore[i*m-1]*m
        }
    }
    
    return price
}

solution(3, 4, [1, 2, 3, 1, 2, 3, 1])
solution(4, 3, [4, 1, 2, 2, 4, 4, 4, 4, 1, 2, 4, 2])
