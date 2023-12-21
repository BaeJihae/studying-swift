//
//  main.swift
//  Makinghamburgers
//
//  Created by 배지해 on 2023/08/11.
//

import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var ingredient = ingredient
    
    // 햄버거가 만들어지는 순서
    let ham: Array = [ 1, 2, 3, 1]
    
    // 만들어지는 햄버거의 개수
    var count = 0
    
    // 1 - 2 - 3 - 1 순서로 나열되어있다면, count에 1더하기
    while true {
        if ingredient.contains([ 1, 2, 3, 1]) == true {
            count += 1
            for i in ingredient.ranges(of: ham) {
                ingredient.removeSubrange(i)
            }
        }else {
            break
        }
    }
    return count
}


print(solution([2, 1, 1, 2, 3, 1, 2, 3, 1]))

func solution2(_ ingredient:[Int]) -> Int {
    
    var ingredient = ingredient

    // 만들어지는 햄버거의 개수
    var count = 0
    var check = 0
    while check < ingredient.count {
        for (i, k) in ingredient.enumerated(){
            if k == 1 && i <= ingredient.count - 4{
                if ingredient[i] == 1 && ingredient[i+1] == 2 && ingredient[i+2] == 3 && ingredient[i+3] == 1 {
                    count += 1
                    ingredient.removeSubrange(i...i+3)
                    break
                }
            }
        }
        check += 1
    }
    return count
}

print(solution2([2, 1, 1, 2, 3, 1, 2, 3, 1]))

func repeatIn(_ ingredient:[Int]) -> ( Int, [Int]) {
    var ingredient = ingredient
    var count = 0
    for (i, k) in ingredient.enumerated(){
        if k == 1 && i <= ingredient.count - 4{
            if ingredient[i] == 1 && ingredient[i+1] == 2 && ingredient[i+2] == 3 && ingredient[i+3] == 1 {
                count += 1
                ingredient.removeSubrange(i...i+3)
            }
        }
    }
    return (count, ingredient)
}


func solution3(_ ingredient:[Int]) -> Int {
    
    var ingredient = ingredient

    // 만들어지는 햄버거의 개수
    var count = 0
    var i = 0
    while true {
        if repeatIn(ingredient).0 == 0 {
            break
        }else{
            count += repeatIn(ingredient).0
            ingredient = repeatIn(ingredient).1
        }
    }

    return count
}


print(solution3([2, 1, 1, 2, 3, 1, 2, 3, 1]))

func solution4(_ ingredient:[Int]) -> Int {
    
    var ingredient = ingredient
    
    // 햄버거가 만들어지는 순서
    let ham: Array = [ 1, 2, 3, 1]
    
    // 만들어지는 햄버거의 개수
    var count = 0

    // 1 - 2 - 3 - 1 순서로 나열되어있다면, count에 1더하기
    while true {
        if Set(ingredient).isSuperset(of: ham) {
            count += 1
            for i in ingredient.ranges(of: ham) {
                ingredient.removeSubrange(i)
            }
        }else {
            break
        }
    }
    return count
}
print(solution4([2, 1, 1, 2, 3, 1, 2, 3, 1]))



func solution5(_ ingredient:[Int]) -> Int {
    
    // 빈 배열 만들기
    var array: [Int] = []
    
    // 만들어지는 햄버거의 개수
    var count = 0
    
    var n = 0
    
    for i in ingredient {
        array.append(i)
        
        if array.count < 4 {
            continue
        }
        n = array.count
        if array[n-4..<n] == [1, 2, 3, 1]{
            count += 1
            array = Array(array[0..<n-4])
        }
    }
    return count
}
print(solution5([2, 1, 1, 2, 3, 1, 2, 3, 1]))
