//
//  [ 프로그래머스 ] 258712 _ 가장 많이 받은 선물
//
//  문제 링크
//  https://school.programmers.co.kr/learn/courses/30/lessons/258712
//

import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    
    let friends = friends.sorted()
    let n = friends.count
    
    // 선물 지수
    var giftIndex = [Int](repeating: 0, count: n)

    // 서로 주고 받은 선물의 개수를 0으로 초기화
    var RecordOfExchangingGifts = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
    // 다음 달에 선물 받을 개수
    var nextMonth = [Int](repeating: 0, count: n)
    

    gifts.sorted().forEach{ gifts in
                           
        let giftsRecord = gifts.split(separator: " ").map{ $0 }
                           
        // 선물을 준 사람의 인덱스 번호
        let give = friends.firstIndex(of: String(giftsRecord[0]))!
        // 선물을 받은 사람의 인덱스 번호
        let take = friends.firstIndex(of: String(giftsRecord[1]))!
        
        giftIndex[give] += 1
        giftIndex[take] -= 1
        RecordOfExchangingGifts[give][take] += 1
    }
    
    // n * n-1 / 2 비교
    for i in 0..<n{
        for j in 0..<n{
            // 탐색해야할 인덱스만 추려냄.
            if i != j && RecordOfExchangingGifts[i][j] != -1 {
                // 주고 받은 기록이 없거나 주고 받은 수가 같을 때
                if ( RecordOfExchangingGifts[i][j] == 0 && RecordOfExchangingGifts[j][i] == 0 ) || RecordOfExchangingGifts[i][j] == RecordOfExchangingGifts[j][i] {
                    // 선물 지수 비교
                    if giftIndex[i] > giftIndex[j] {
                        nextMonth[i] += 1
                    }else if giftIndex[i] < giftIndex[j]{
                        nextMonth[j] += 1
                    }
                // 주고 받은 기록이 있을 때, 비교
                }else if RecordOfExchangingGifts[i][j] > RecordOfExchangingGifts[j][i] {
                    nextMonth[i] += 1
                }else if RecordOfExchangingGifts[i][j] < RecordOfExchangingGifts[j][i] {
                    nextMonth[j] += 1
                }
                // 이미 탐색한 인덱스 번호 표시
                RecordOfExchangingGifts[i][j] = -1
                RecordOfExchangingGifts[j][i] = -1
            }
        }
    }
     
    // 선물 받을 개수의 최댓값 리턴
    return nextMonth.max() ?? 0
}

print(solution(["joy", "brad", "alessandro", "conan", "david"], ["alessandro brad", "alessandro joy", "alessandro conan", "david alessandro", "alessandro david"]))
