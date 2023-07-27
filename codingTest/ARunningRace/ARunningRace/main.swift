//
//  main.swift
//  ARunningRace
//
//  Created by 배지해 on 2023/07/26.
//
import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    // 추월당한 결과값을 적을 배열
    var newPlayers = players
    
    // 추월한 선수순위를 빠르게 찾기 위한 딕셔너리 <value:선수순위, key:선수이름>
    var dict:Dictionary<String, Int> = [String: Int]()
    for i in 0..<players.count{
        dict.updateValue(i, forKey: players[i])
    }
    
    for overtake in callings{
        
        // 추월한 선수의 index 번호
        var index = dict[overtake]!
        // 추월당한 선수 이름
        let overtaked = newPlayers[index-1]
        
        // 배열에서 추월당한 선수와 추월한 선수 위치 바꾸기
        newPlayers.swapAt( index-1, index)
        
        // 딕셔너리에서 추월당한 선수와 추월한 선수 위치 바꾸기
        dict.updateValue( index-1, forKey: overtake)
        dict.updateValue( index, forKey: overtaked)
    }
    
    return newPlayers
}

print(solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"]))
