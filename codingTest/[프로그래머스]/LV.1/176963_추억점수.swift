//
//  main.swift
//  MemoryScore
//
//  Created by 배지해 on 2023/07/28.
//
import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    
    // name을 키 yearning을 value로 하는 딕셔너리
    var dic: Dictionary<String, Int> = [:]
    for i in 0..<name.count{
        dic[name[i]] = yearning[i]
    }
    
    // 그리움 점수를 합산할 변수
    var count:Int = 0
    // 결과값 배열
    var result: [Int] = []
    
    // photo의 각 배열에서 name에 따른 value값 환산해 더해주기
    for n in photo {
        for photoName in n {
            if let pN = dic[photoName] {
                count += pN
            }
        }
        result.append(count)
        count = 0
    }
    return result
}
//
//solution(["may", "kein", "kain", "radi"], [5, 10, 1, 3], [["may", "kein", "kain", "radi"],["may", "kein", "brin", "deny"], ["kon", "kain", "may", "coni"]])
//
//solution(["kali", "mari", "don"], [11, 1, 55], [["kali", "mari", "don"], ["pony", "tom", "teddy"], ["con", "mona", "don"]])
//solution(["may", "kein", "kain", "radi"], [5, 10, 1, 3], [["may"],["kein", "deny", "may"], ["kon", "coni"]])
