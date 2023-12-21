import Foundation

let str:String = "안녕하세요__ 저는 초보__ 개발자 지해입니다__"
    
str.components(separatedBy: " ")
// result : ["안녕하세요__", "저는", "초보__", "개발자", "지해입니다__"]
str.components(separatedBy: "__")
// result : ["안녕하세요", " 저는 초보", " 개발자 지해입니다", ""]

let str2:String = "안녕하세요  저는  초보  개발자  지해입니다"

str2.components(separatedBy: " ")
// result : ["안녕하세요", "", "저는", "", "초보", "", "개발자", "", "지해입니다"]

////let str:String = "안녕하세요. 저는 초보 개발자 지해입니다~!"
//
//
//let str:String = "안녕하세요__ 저는 초보__ 개발자 지해입니다__"
//
//str.split(separator: " ")
//// result : ["안녕하세요__", "저는", "초보__", "개발자", "지해입니다__"]
//str.split(separator: "__")
//// result : ["안녕하세요", " 저는 초보", " 개발자 지해입니다"]
//
//str.split(separator: "__", maxSplits: 0)
//// result : ["안녕하세요__ 저는 초보__ 개발자 지해입니다__"]
//str.split(separator: "__", maxSplits: 1)
//// result : ["안녕하세요", " 저는 초보__ 개발자 지해입니다__"]
//str.split(separator: "__", maxSplits: 2)
//// result : ["안녕하세요", " 저는 초보", " 개발자 지해입니다__"]
//str.split(separator: "__", maxSplits: 3)
//// result : ["안녕하세요", " 저는 초보", " 개발자 지해입니다"]
//str.split(separator: "__", maxSplits: 10)
//// result : ["안녕하세요", " 저는 초보", " 개발자 지해입니다"]
//
//// result : ["안녕하세요", " 저는 초보", " 개발자 지해입니다"]
//
//
//
//str.split(separator: "__", omittingEmptySubsequences: false)
//
//// result : ["안녕하세요", " 저는 초보", " 개발자 지해입니다", ""]
//
//str.split(separator: "__", omittingEmptySubsequences: true)
//
//// result : ["안녕하세요", " 저는 초보", " 개발자 지해입니다"]
//
//
//
//
//let str2:String = "안녕하세요  저는  초보  개발자  지해입니다"
//
//str2.split(separator: " ", omittingEmptySubsequences: true)
//// result : ["안녕하세요", "저는", "초보", "개발자", "지해입니다"]
//
//str2.split(separator: " ", omittingEmptySubsequences: false)
//// result : ["안녕하세요", "", "저는", "", "초보", "", "개발자", "", "지해입니다"]


let comparison = "안녕하세요 저는 지해에요.           "

comparison.split(separator: " ")
// result : ["안녕하세요", "저는", "지해에요."]
comparison.components(separatedBy: " ")
// result : ["안녕하세요", "저는", "지해에요.", "", "", "", "", "", "", "", "", "", "", ""]

