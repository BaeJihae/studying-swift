//
//  main.swift
//  The nearest same letter closest to
//
//  Created by 배지해 on 2023/08/03.
//

import Foundation

//"bannana"   [-1, -1, -1, 2, 2, 2]
//"foobar"    [-1, -1, 1, -1, -1, -1]
//"nnnnnnn"   [-1, 1, 1, 1, 1, 1, 1 ]

//func solution(_ s:String) -> [Int] {
//
//    // 답을 넣은 배열
//    var answer: [Int] = []
//
//    // s를 배열로 바꾸기
//    let word = Array( s.map{ String($0) })
//
//    // 한 단어씩 비교하여 담기
//    for i in 0..<s.count{
//
//        // 현재 단어의 앞을 비교할 인덱스
//        var forward = i
//        // 현재 단어의 뒤를 비교할 인덱스
//        var backward = i
//        // 앞에서 비교했을 때의 같은 문자와의 거리
//        var answer1 = s.count
//        // 뒤에서 비교했을 때의 같은 문자와의 거리
//        var answer2 = s.count
//        // 그 글자가 존재하는지 확인하는 변수
//        var isExist: Bool = false
//
//        // 자신의 앞에서부터 제일 앞까지 하나씩 조사
//        while (forward > 0){
//            forward -= 1
//            // 만약 같은 문자가 존재한다면
//            if word[i] == word[forward]{
//                // 거리 조사, 존재한다, 반복문 나가기
//                answer1 = i-forward
//                isExist = true
//                break
//            }
//        }
//        // 앞에서 존재하지 않는다가 나왔으면 한번도 안나온 문자
//        if isExist == false {
//            // -1 추가하고 나가기
//            answer.append(-1)
//        }
//        // 자신의 뒤에서부터 제일 뒤까지 하나씩 조사
//        while (backward < s.count-1){
//            // 앞에서 존재하지 않는다가 나왔으면 한번도 안나온 문자
//            if isExist == false {
//                break
//            }
//            backward += 1
//            // 만약 같은 문자가 존재한다면
//            if word[i] == word[backward]{
//                // 거리 조사, 반복문 나가기
//                answer2 = backward-i
//                break
//            }
//        }
//        // 존재한다일 때,
//        if isExist == true {
//            // 앞의 거리와 뒤의 거리 조사해 더 짧은 것을 정답에 입력
//            answer.append( answer1 >= answer2 ? answer2 : answer1)
//        }
//    }
//    return answer
//}



func solution(_ s:String) -> [Int] {
    
    // 답을 넣은 배열
    var answer: [Int] = []
    
    // s를 배열로 바꾸기
    let word = Array( s.map{ String($0) })
   
    // 한 단어씩 비교하여 담기
    for i in 0..<s.count{
        
        // 현재 단어의 앞을 비교할 인덱스
        var forward = i

        // 그 글자가 존재하는지 확인하는 변수
        var isExist: Bool = false
        
        // 자신의 앞에서부터 제일 앞까지 하나씩 조사
        while (forward > 0){
            forward -= 1
            // 만약 같은 문자가 존재한다면
            if word[i] == word[forward]{
                // 거리 조사, 존재한다, 반복문 나가기
                answer.append(i-forward)
                isExist = true
                break
            }
        }
        // 앞에서 존재하지 않는다가 나왔으면 한번도 안나온 문자
        if isExist == false {
            answer.append(-1)
        }
    }
    return answer
}

print(solution("baaab"))
