import UIKit

class Book{
    
    var name: String
    var price: Int
    var publisher: String
    var author: String
    var pagesNum: Int
    
    init(n: String, p: Int, pub: String, a: String, page: Int){
        self.name = n
        self.price = p
        self.publisher = pub
        self.author = a
        self.pagesNum = page
    }
}

var book1 = Book(n: "녹나무의 파수꾼", p: 30000, pub: "소미미디어", a: "히가시노 게이고", page: 554)

var book2 = Book(n: "시간을 멈추는 법", p: 18000, pub: "북폴리오", a: "매트 헤이그", page: 502)

book2.publisher = "new북폴리오"

/*=================================================================*/

class Member{
    
    var name: String
    var gender: String
    var age: Int
    var address: String
    
    init(n: String, g: String, a: Int, ad: String){
        
        self.name = n
        self.gender = g
        self.age = a
        self.address = ad
    
    }
}

var member1 = Member(n: "배지해", g: "여", a: 23, ad: "죽전동")
var member2 = Member(n: "배나경", g: "여", a: 27, ad: "감삼동")






/*=================================================================*/

class Movie{
    
    var name: String
    var genre: String
    var mainActor: String
    var director: String
    var releaseDate: String
    
    init(n: String, g: String, m: String, d: String, r: String){
        self.name = n
        self.genre = g
        self.mainActor = m
        self.director = d
        self.releaseDate = r
    }
    
}

var movie1 = Movie(n: "베테랑", g: "액션", m: "유아인", d: "류승완", r: "2015-8-5")

var movie2 = Movie(n: "크루엘라", g: "액션", m: "엠마 스톤", d: "크레이그 길레스피", r: "2021-5-28")


/*=================================================================*/


class Weather {
    var currentWeather: String
    var temperature: Int
    var fineDust: String
    var date: String
    
    init(c: String, t: Int, f: String, d: String){
        self.currentWeather = c
        self.temperature = t
        self.fineDust = f
        self.date = d
    }
}

var weather1 = Weather(c: "Sun", t: 26, f: "good", d: "6/30")
var weather2 = Weather(c: "Rain", t: 28, f: "verygood", d: "7/1")
