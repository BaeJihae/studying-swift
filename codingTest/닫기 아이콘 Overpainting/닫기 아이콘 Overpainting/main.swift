//
//  main.swift
//  닫기 아이콘 Overpainting
//
//  Created by 배지해 on 2023/08/02.
//

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var k = section[0] + m - 1
    var count = 1
    for i in section {
        if i > k {
            k = i + m - 1
            count += 1
            if k >= n {
                break
            }
        }
    }
    return count
}

print(solution(8, 4, [2, 3, 6]))
