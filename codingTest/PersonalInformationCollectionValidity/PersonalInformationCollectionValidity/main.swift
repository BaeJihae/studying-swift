//
//  main.swift
//  PersonalInformationCollectionValidity
//
//  Created by 배지해 on 2023/08/08.
//

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    // 오늘의 날짜
    let todayYear = Int(today.split(separator: ".")[0])!
    let todayMonth = Int(today.split(separator: ".")[1])!
    let todayDay = Int(today.split(separator: ".")[2])!
    
    // 약관 종류에 따른 기간을 딕셔너리에 추가
    var kindOfTerms: Dictionary<String, Int> = [:]
    for i in terms{
        kindOfTerms.updateValue(Int(i.split(separator: " ")[1])!, forKey: String(i.split(separator: " ")[0]))
    }
    
    // 보관 가능한 인덱스 번호 저장
    var answer: [Int] = []
    
    for i in 0..<privacies.count{
        let dates = privacies[i].split(separator: " ")[0]
        let kind = String(privacies[i].split(separator: " ")[1])
        var year = Int(dates.split(separator: ".")[0])!
        var month = Int(dates.split(separator: ".")[1])!
        var day = Int(dates.split(separator: ".")[2])!
        
        if let period = kindOfTerms[kind] {
            month += period
            day -= 1
            if day == 0 {
                month -= 1
                day = 28
            }
            if month > 12 {
                year += (month/12)
                month %= 12
            }
        }
        if (year-1)*12*28+(month-1)*28+day < (todayYear-1)*12*28+(todayMonth-1)*28+todayDay {
            answer.append(i+1)
        }
        
        print(year, month, day)
        print(todayYear, todayMonth, todayDay)
    }
    return answer
}

//print(solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]))
//
//print(solution("2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"]))
//
//print(solution("2021.01.28", ["A 2"], ["2020.12.01 A", "2010.01.01 A"]))

print(solution("2016.02.15", ["A 100"], ["2000.06.16 A", "2008.02.15 A"]))

print(solution("2020.12.17", ["A 12"], ["2010.01.01 A", "2019.12.17 A"]))


func a() -> Int {
    var numbers = [1,2,3,4,6,7,8,0]
    var answer = 0
    numbers = numbers.sorted()
    for i in 0...9 {
        if numbers.contains(i) == false{
            answer += i
        }
    }
    return answer
}

print(a())
