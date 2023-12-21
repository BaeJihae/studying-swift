import UIKit

// 서버에서 주는 데이터 ===========================================================
struct MovieData: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Codable {
    let rank: String
    let movieNm: String
    let audiCnt: String
    let audiAcc: String
    let openDt: String
}

// 내가 만들고 싶은 데이터 (우리가 쓰려는 Struct / Class) =======================
struct Movie {
    static var movieId: Int = 0   // 아이디가 하나씩 부여되도록 만듦
    let movieName: String
    let rank: Int
    let openDate: String
    let todayAudience: Int
    let totalAudience: Int
    
    init(movieNm: String, rank: String, openDt: String, audiCnt: String, audiAcc: String) {
        self.movieName = movieNm
        self.rank = Int(rank)!
        self.openDate = openDt
        self.todayAudience = Int(audiCnt)!
        self.totalAudience = Int(audiAcc)!
        Movie.movieId += 1
    }
}

struct MovieDataManager {
    let movieURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
    
    let myKey = "4bdad5fd0c2c3a86927c0d3587762da7"
    
    func fetchMovie(date: String, completion: @escaping ([Movie]?) -> Void) {
        let urlString = "\(movieURL)&key=\(myKey)&targetDt=\(date)"
        performRequest(with: urlString) { (movies) in
            completion(movies)
        }
    }
    
    func performRequest(with urlString: String, completion: @escaping ([Movie]?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                completion(nil)
                return
            }
            
            guard let safeData = data else {
                completion(nil)
                return
            }
            
        }
        
        task.resume()
    }
    
    func parseJSON(_ movieData: Data) -> [Movie]? {
        do{
            let decodedData = try  JSONDecoder().decode(MovieData.self, from: movieData)
            
            let dailyLists = decodedData.boxOfficeResult.dailyBoxOfficeList
            
            let movieLists = dailyLists.map{
                Movie(movieNm: $0.movieNm, rank: $0.rank, openDt: $0.openDt, audiCnt: $0.audiCnt, audiAcc: $0.audiAcc)
            }
            
            return movieLists
        } catch {
            print("파싱 실패")
            
            return nil
        }
    }
}





var downloadedMoives = [Movie]()

let movieManager = MovieDataManager()

movieManager.fetchMovie(date: "20231001") { (movies) in
    if let movies = movies {
        downloadedMoives = movies
        dump(downloadedMoives)
        
        print("전체 영화 갯수 확인: \(Movie.movieId)")
    }else {
        print("영화데이터가 없습니다.")
    }
}
