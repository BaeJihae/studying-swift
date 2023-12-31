//
//  [ 프로그래머스 ] 181910 - 문자열의 뒤의 n글자 
//
//  문제 링크
//  https://school.programmers.co.kr/learn/courses/30/lessons/181910
//
import Foundation

func solution(_ my_string:String, _ n:Int) -> String {
    return String(my_string.suffix(n))
}
print(solution("ProgrammerS123", 11))
