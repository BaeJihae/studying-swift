import UIKit


// 스위프트에서 만들어 놓은 dateComponents을 사용하여 date()를 원하는 시간대로 지정할 수 있음

var components = DateComponents()

components.year = 2023
components.month = 1
components.day = 1

components.hour = 9
components.minute = 0
components.second = 0

var settingDate = Calendar.current.date(from: components)!
print(settingDate)



// 더 세련된 방법으로 date라는 구조체를 확장하여 위의 구조를 사용할 수 있음

extension Date {
    init?( y year: Int, m month: Int, d day: Int){
        
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        guard let date = Calendar.current.date(from: components) else{
            return nil
        }
        
        self = date
    }
}
