import UIKit


let MovieUrl = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=4bdad5fd0c2c3a86927c0d3587762da7&targetDt=20231001"

let url = URL(string: MovieUrl)!

let session = URLSession(configuration: .default)

let task = session.dataTask(with: url) { data, response, error in
    
    if error != nil {
        print(error!)
        return
    }
    
    guard let safeData = data else { return }
    
    do {
        
        let decodeData = try JSONDecoder().decode(Movie.self, from: safeData)
        
        dump(decodeData.boxOfficeResult.dailyBoxOfficeList)
        
    } catch {
        print("에러발생")
    }
}
task.resume()


//func parseJSON(_ jsonData: Data) -> [DailyBoxOfficeList]? {
//    
//    do {
//        
//        let decodeData = try JSONDecoder().decode(Movie.self, from: jsonData)
//        
//        return decodeData.boxOfficeResult.dailyBoxOfficeList
//        
//    } catch {
//        return nil
//    }
//}




// MARK: - Movie
struct Movie: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Codable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Codable {
    let rnum, rank, rankInten: String
    let movieCD, movieNm, openDt, salesAmt: String
    let salesShare, salesInten, salesChange, salesAcc: String
    let audiCnt, audiInten, audiChange, audiAcc: String
    let scrnCnt, showCnt: String
}




