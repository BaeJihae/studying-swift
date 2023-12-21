import UIKit

/*
다음은 스위프트에서 날짜 및 시간을 처리하는 것과 관련된 연습문제입니다.

1. 현재 날짜와 시간을 나타내는 'Date' 타입의 인스턴스를 만듭니다. 이 날짜를 출력해보세요.
2. 현재 날짜에서 7일(1주일) 전 날짜를 계산합니다. 이 날짜를 출력해보세요. Calendar.current.date(byAdding: ,value: , to: ) 메서드를 이용합니다.
3. DateFormatter 타입의 인스턴스를 생성하고 현재 날짜를 ""MM-dd-yyy HH:mm"" 형식의 문자열 형식으로 지정합니다. 이 문자열을 출력해보세요.
 */

let today = Date()
print(today)

let agoOneWeek = today - 24*60*60*7
let agoOneWeek2 = Calendar.current.date(byAdding: .day, value: -7, to: today)!
print(agoOneWeek2)

let dateform = DateFormatter()
dateform.dateFormat = "MM-dd-yyy HH:mm"
print(dateform.string(from: today))


/* 접근제어자 에 대해 설명합니다. */

// 접근제어자는 속성, 타입, 함수 등 인스턴스를 접근할 수 있는 범위를 지정하는 키워드이다.
// 접근제어자를 사용하면, 컴파일이 더 빨라지고, 정보를 은닉화할 수 있으며(캡슐화), 코드 영역을 분리시켜 효율적으로 사용가능하다.
// 접근제어자의 종류는 private, fileprivate, internal, public ,open 이다.
// private는 같은 범위(scope)안에서만 접근이 가능하다.
// fileprivate는 같은 파일 안에서만 접근이 가능하다.
// internal은 기본적인 디폴트값으로 같은 모듈 내에서만 접근이 가능하다.
// public은 다른 모듈에서도 접근이 가능하다.
// open은 다른 모듈에서도 접근이 가능하고, 상속, 재정의가 가능하다.

// 클래스의 접근자의 가장 낮은 단계는 open이고, 구조체의 접근자의 가장 낮은 단계는 public이다.
// 구조체는 상속 및 재정의가 불가능하기 때문,

