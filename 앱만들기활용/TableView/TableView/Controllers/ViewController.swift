//
//  ViewController.swift
//  TableView
//
//  Created by 배지해 on 1/13/24.
//

import UIKit

// TableView를 사용하기 위한 UITableViewDataSource 프로토콜 채택
class ViewController: UIViewController {
  
    @IBOutlet weak var tableView: UITableView!
    
    // 테이블 뷰의 데이터를 저장하기 위한 배열
    //var moviesArray: [Movie] = []
    
    // MVC패턴을 위한 데이터 매니저 ( 배열 관리 - 데이터 )
    var movieDataManager = DataManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDates()
        
        // ⭐️ 데이터소스 델리게이트 패턴의 대리자 설정
        tableView.dataSource = self
        
        // ⭐️ 델리게이트 패턴의 대리자 설정
        tableView.delegate = self
        
        // cell의 높이 설정
        tableView.rowHeight = 120
        
        // 테이블 뷰의 이름 추가
        title = "영화목록"

    }
    
    
    func setupDates() {
        
        // 데이터 매니저에게 데이터 요청 ( 일반적으로는 서버에서 요청하는 과정 )
        movieDataManager.makeMovieData()
        
        // 데이터 매니저에게 데이터를 받아와서 VC의 배열에 저장
        // moviesArray = movieDataManager.getMovieData()
        
        
        // cell을 등록하는 과정이 원래는 필요하지만, tableView를 스토리보드를 통해 구현을 했기 때문에 생략가능 ( 스토리 보드 내부의 이 함수가 숨어있음. )
        // tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier : <#T##String#>)
        
    }
    
    // Table View에 새로운 Cell을 생성하는 버튼
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        // movieDataManger에게 movieData 추가를 요청
        movieDataManager.updateMovieData()
        
        // tableView의 데이터를 리로드
        tableView.reloadData()
        
    }
    
    
}

// 테이블 뷰로 전달해주는 데이터 소스에 대한 델리게이트 함수 구현
extension ViewController: UITableViewDataSource {
    
    // 1) 테이블 뷰에 몇 개의 Contents를 표시하는지 tableView에게 알려주는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        
        // 내가 가진 데이터의 개수
        // return moviesArray.count
        return movieDataManager.getMovieData().count
    }
    
    // 2) TableView의 구체적인 Cell의 형태를 tableView에게 알려주는 함수 / indexPath : 몇 번째 셀인지를 지칭하는 변수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        // (힙에 올라간) 재사용이 가능한 cell을 꺼내서 사용하는 함수
        // 이때, 스토리보드의 tableView의 identifier을 설정해야함.
        // indexPath는 cell의 몇번째인지를(경로가 어디인지를) 알려줌.
        // dequeueReusableCell의 리턴 값이 UITableViewCell이기 때문에 타입 캐스팅이 필요함.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        // 데이터 매니저에게 영화 데이터를 요청하여 그 데이터의 각각의 행에 접근
        // let movie = moviesArray[indexPath.row]
        let movie = movieDataManager.getMovieData()[indexPath.row]
        
        // cell에 표시할 값들을 movieData에서 꺼내서 표시
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        
        return cell
    }
}

// 테이블 뷰에서 행해지는 모션에 대한 델리게이트 함수 구현
extension ViewController: UITableViewDelegate {
    
    // 테이블 뷰의 특정한 행이 선택되었을 때의 어떤 동작을 할 것인지 VC에게 물어봄.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // ⭐️ 세그웨이를 실행
        performSegue(withIdentifier: "toDetail", sender: indexPath)
        
    }

    // prepare 세그웨이 ( 데이터 연결에 중요한 함수 )
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // identifier 꼭 확인하기
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            
            let array = movieDataManager.getMovieData()
            
            let indexPath = sender as! IndexPath
            
            // 배열에서 아이템을 꺼내서 다음 화면에게 전달
            detailVC.movieData = array[indexPath.row]
        }
    }
    
}
