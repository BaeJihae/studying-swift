//
//  main.swift
//  BingoGame
//
//  Created by 배지해 on 2023/06/13.
//

import Foundation

// 0부터 100사이의 랜덤한 정수값
var comChoice = Int.random(in: 0...100)
var myChoice:Int = 0

while true {
    var input = readLine()
    
    if let inputString = input {
        if let inputInt = Int(inputString){
            myChoice = inputInt
        }
    }
    
    if comChoice > myChoice {
        print("UP")
    }else if comChoice < myChoice {
        print("Down")
    }else {
        print("Bingo!")
        break
    }
    
}
