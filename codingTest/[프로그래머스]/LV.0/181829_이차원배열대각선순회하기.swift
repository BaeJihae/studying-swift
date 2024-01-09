//
//  [ 프로그래머스 ] 181829 - 이차원 배열 대각선 순회하기
//
//  문제 링크
//  https://school.programmers.co.kr/learn/courses/30/lessons/181829
//

import Foundation

func solution(_ board:[[Int]], _ k:Int) -> Int {
    var answer: Int = 0
    (0...board.count-1).forEach{ i in (0...board.count-1).forEach{ j in if i + j <= k {answer += board[i][j]}}}
    return answer
}

print(solution([[0, 1, 2],[1, 2, 3],[2, 3, 4],[3, 4, 5]],2))
