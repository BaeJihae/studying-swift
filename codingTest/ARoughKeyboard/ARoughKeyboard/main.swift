//
//  main.swift
//  ARoughKeyboard
//
//  Created by 배지해 on 2023/07/28.
//

import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    // keymap 딕셔너리에 넣어서 배열에 넣기
    var keymapA: [Dictionary<Character, Int>] = []
    
    for i in keymap{
        var dict: Dictionary<Character, Int> = [:]
        var a = Array(i.map{ $0 })
        for j in stride(from: a.count-1, through: 0, by: -1){
            dict.updateValue(j+1, forKey: a[j])
        }
        keymapA.append(dict)
    }
    
    var targetsA : [[Character]] = []
    // targets 문자열 분리해서 배열에 넣기
    for i in targets{
        targetsA.append( Array(i.map { $0 }) )
    }
    
    var count:[Int] = []
    var countA = 0
    var result: [Int] = []
    
    for array in targetsA{
        for x in array {
            for i in keymapA{
                if let k = i[x]{
                    count.append(k)
                }
            }
            if count.isEmpty == true {
                countA = -1
                count = []
                break
            }else{
                countA += count.min()!
                count = []
            }
        }
        result.append(countA)
        countA = 0
    }
    return result
}

print(solution(["ABACD", "BCEFD"], ["ABCD","AABB"]))
print(solution(["AA"], ["B"]))
print(solution(["AGZ", "BSSS"], ["ASA","BGZ"]))
print(solution(["BC"], ["AC", "BC"]))
