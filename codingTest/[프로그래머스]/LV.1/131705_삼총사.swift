//
//  [ 프로그래머스 ] 131705 - 삼총사
//
//  문제 링크
//  https://school.programmers.co.kr/learn/courses/30/lessons/131705
//

import Foundation

func solution(_ number:[Int]) -> Int {
    var answer = 0
    (0...number.count-3).forEach { i in
        if i+1 <= number.count-2 {
            (i+1...number.count-2).forEach { j in
                if j+1 <= number.count-1 {
                    (j+1...number.count-1).forEach { k in
                        print(i, j, k)
                        if number[i] + number[j] + number[k] == 0 {
                                answer += 1
                        }
                    }
                }
            }
        }
    }
    return answer
}

print(solution([-3, -2, -1, 0, 1, 2, 3]))
