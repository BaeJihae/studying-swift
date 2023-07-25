import UIKit

var string : String = "Baejihae"


// 문자열 길이 출력
print(type(of: string.count))
print(string.count)

// 문자열 뒤집기
String(string.reversed())

// 문자열 추가하여 출력하기
for i in 0...3{
    print(String(repeating: "*", count: i))
}

// 짝수, 홀수 출력하는 함수
func solution(_ num_list:[Int]) -> [Int] {
    return [num_list.filter{$0 % 2 == 0}.count, num_list.filter{$0 % 2 == 1}.count]
}

// 문자열 분리하여 배열에 저장하는 방법
var my_array = Array(string.map{String($0)})

// 특정 문자열 삭제하기
string.components(separatedBy: "a").joined()
string.filter{String($0) != "a"}
string.replacingOccurrences(of: "a", with: "")
