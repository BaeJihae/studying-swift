import UIKit

/** 날짜와 시간 다루기 **/

// 2001.1.1. 00:00:00 UTC시간을 기준으로 몇 초가 흘렀는지 출력 ( <- 보편적으로 많이 사용 )
Date().timeIntervalSinceReferenceDate

// 1970.1.1 00:00:00 UTC시간을 기준으로 몇 초가 흘렀는지 출력 ( <- 예전에 많이 사용 )
Date().timeIntervalSince1970


// 현재 날짜 및 시간
var now = Date()

// 하루 = 24 * 60 * 60 = 86400초
24 * 60 * 60

// 어제 날짜 및 시간 ( 24시간 전의 )
let yesterday = now - 86400

// 시간 사이의 간격
now.timeIntervalSince(yesterday)
// 지금 시간을 중심으로 해당 날짜와의 거리
now.distance(to: yesterday)
yesterday.distance(to: now)

// 내일 날짜 및 시간 ( 24시간 후 )
let tomorrow = now.advanced(by: 86400)
now+86400
now.addingTimeInterval(86400)






// but Date() 만을 가지고는 아무것도 할 수 없음.
// 사용하기 위해서는 calendar이라는 구조체의 도움을 받아야함.

// calendar이라는 구조체는 절대 시점 ( date() )를 우리가 사용하기 편리한 달력 구조로 바꾸어주는 것을 도와주는 구조체
// 그레고리력 (Gregorian calendar) - 양력 (전세계표준 달력)
var calendar = Calendar.current

// 위의 구조체 선언과 동일함.
// 유저가 선택한 달력 기준 ( 세계적인 서비스를 할 때는 이것을 사용 )
let calendar1 = Calendar.autoupdatingCurrent
// 직접 생성 ( 잘 사용하지 않음 )
let calendar2 = Calendar(identifier: .gregorian)




// 달력의 지역
calendar.locale
// 타임존 (UTC 시간과 관련 있음 )
calendar.timeZone

// 달력의 지역을 직접 설정 가능 -> 인터넷에 쳐서 사용하면 됨.
calendar.locale = Locale(identifier: "ko_KR")

// 타임존도 설정 가능 -> 이것도 찾아서 쓰면 됨.
//calendar.timeZone = TimeZone(identifier: "Asia/Seoul")





/**==================================================================================
 - 지역설정 문자열: https://gist.github.com/xta/6e9b63db1fa662bb3910b680f9ebd458  (700여개)
 - 타임존 문자열: https://gist.github.com/mhijack/2b63b84d96802ccc719291474ac9df72 (440여개)
 ==================================================================================**/



//now = now - 12*60*60

let nowHour = calendar.component(.hour, from: now)
let nowMinute = calendar.component(.minute, from: now)
let nowSecond = calendar.component(.second, from: now)

let year = calendar.component(.year, from: now)
let month = calendar.component(.month, from: now)
let day = calendar.component(.day, from: now)

// 요일은 숫자로 표기
// 일(1) 월(2) 화(3) 수(4) 목(5) 금(6) 토(7)
// enum 열거형으로 이루어져있음
let weekday = calendar.component(.weekday, from: now)

let yesterdayYear = calendar.component(.year, from: yesterday)
let yesterdayMonth = calendar.component(.month, from: yesterday)
let yesterdayDay = calendar.component(.day, from: yesterday)


// 직접 사용하는 방법 -> DataFomatter로도 나타낼 수 있다.
print("오늘은 \(year)년 \(month)월 \(day)일 입니다.")

if nowHour >= 13 {
    print("지금 시각은 오후 \(nowHour%12)시 \(nowMinute)분 \(nowSecond)초 입니다.")
}else{
    print("지금 시각은 오전 \(nowHour)시 \(nowMinute)분 \(nowSecond)초 입니다.")
}






// dateComponants : 하나가 아닌 여러개의 데이터를 얻는 방법

let myDateCom = calendar.dateComponents([.year, .month, .day], from: now)
let myTimeCom = calendar.dateComponents([.hour, .minute, .second], from: now)


myDateCom.year
myDateCom.month
myDateCom.day

print("\(myTimeCom.hour!)시 \(myTimeCom.minute!)분 \(myTimeCom.second!)초")







// data Fomatter
// : 날짜와 시간을 원하는 형식으로 변경하는 클래스

// (1) 지역 설정
// (2) 시간대 설정
// (3) 날짜형식 설정
// (4) 시간형식 설정

// 1) date() -> string으로 변경하는 방법
// 2) string -> data()으로 변경하는 방법



// 1) date() -> string으로 변경하는 방법

let dateForm = DateFormatter()

// (1) 지역 설정

// 나라 또는 지역 마다 날짜와 시간을 표시하는 형식과 언어가 다름
// 한국
dateForm.locale = Locale(identifier: "ko_KR")
// 미국
//dateForm.locale = Locale(identifier: "en_US")


// (2) 시간대 설정
dateForm.timeZone = TimeZone.current
//dateForm.timeZone = TimeZone(identifier: "ko_KR")



// i) 스위프트가 이미 정해놓은 형식 사용

// (3) 날짜형식 설정
dateForm.dateStyle = .full    // kr - 2023년 11월 13일 월요일 / us - Monday, November 13, 2023
//dateForm.dateStyle = .long    // kr - 2023년 11월 13일 / us - November 13, 2023
//dateForm.dateStyle = .medium  // kr - 2023. 11. 13. / us - Nov 13, 2023
//dateForm.dateStyle = .short   // kr - 2023. 11. 13. / us - 11/13/23
//dateForm.dateStyle = .none    // 아무것도 표시되지 않음

// (4) 시간형식 설정
dateForm.timeStyle = .full    // kr - 오후 4시 2분 28초 대한민국 표준시 / us - 4:01:10 PM Korean Standard Time
//dateForm.timeStyle = .long    // kr - 오후 4시 2분 19초 GMT+9 / us - 4:01:19 PM GMT+9
//dateForm.timeStyle = .medium  // kr - 오후 4:02:09 / us - 4:01:28 PM
//dateForm.timeStyle = .short   // kr - 오후 4:01 / us - 4:01 PM
//dateForm.timeStyle = .none    // 아무것도 표시되지 않음

// 날짜 및 시간 출력하기
let someString = dateForm.string(from: Date())
print(someString)




// ii) 사용자가 정의한 형식 사용
// - 날짜/시간 형식: http://www.unicode.org/reports/tr35/tr35-25.html#Date_Format_Patterns (유니코드에서 지정)

// 날짜/시간 형식 설정
dateForm.dateFormat = "yyyy년 MM월 dd일 (E)\n현재 시각은 a hh시 mm분 ss초입니다. "

let someString2 = dateForm.string(from: Date())
print(someString2)


// 2) string -> data()으로 변경하는 방법
let newFormatter = DateFormatter()
// 변환하기 위해서는 dateFormat을 반드시 설정해줘야함.
// 그래야 형식을 읽어올 수 있음
newFormatter.dateFormat = "yyyy/MM/dd"


let someDate = newFormatter.date(from: "2023/11/13")
// 한국시간보다 9시간을 뺀 영국시간을 기준으로 출력이됨.
print(someDate!)


// 날짜의 범위를 출력하는 방법 ( 일수를 구하는 것이 아닌 기간형식으로 나타내는 것

let start = Date()
// 두 달 뒤 날짜
let end = start.addingTimeInterval(60*60*24*60)


let dateForm2 = DateFormatter()

// (1) 지역 설정 (2) 시간대 설정 (3) 날짜 형식 (4) 시간 형식
dateForm2.locale = Locale(identifier: "ko_KR")
dateForm2.timeZone = TimeZone.current
dateForm2.dateStyle = .long
dateForm2.timeStyle = .none

print("\(dateForm2.string(from: start)) - \(dateForm2.string(from: end))")




// 프로젝트 활용 예시

struct InstagramPost {
    let title: String = "제목"
    let description: String = "내용설명"
    
    private let date: Date = Date()  // 게시물 생성을 현재날짜로
    
    // 날짜를 문자열 형태로 바꿔서 리턴하는 계산 속성
    var dateString: String {
        get {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            //formatter.locale = Locale(identifier: Locale.autoupdatingCurrent.identifier)
            
            // 애플이 만들어 놓은
            formatter.dateStyle = .medium
            formatter.timeStyle = .full
            
            // 개발자가 직접 설정한
            //formatter.dateFormat = "yyyy/MM/dd"
            
            return formatter.string(from: date)
        }
    }
}



let post1 = InstagramPost()
print(post1.dateString)

sleep(10)

let post2 = InstagramPost()
print(post2.dateString)

