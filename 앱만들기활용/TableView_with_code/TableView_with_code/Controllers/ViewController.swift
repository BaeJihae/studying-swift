//
//  ViewController.swift
//  TableView_with_code
//
//  Created by 배지해 on 1/19/24.
//

import UIKit

class ViewController: UIViewController{

    private let tableView = UITableView()
    
    var moviesArray: [Movie] = []
    
    // MVC패턴을 위한 데이터 매니저 ( 배열 관리 - 데이터 )
    var movieDataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNaviBar()
        setupTableView()
        setupDatas()
        setupTableViewConstrains()
    }
    
    func setupNaviBar() {
        
        // 네비게이션의 이름 설정
        title = "영화목록"
        
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
        let apperance = UINavigationBarAppearance()
        // 배경 불투명으로 설정
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .white
        
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        
    }
    
    func setupTableView() {
        // 델리게이트 패턴의 대리자 설정
        tableView.delegate = self
        tableView.dataSource = self
        
        // 셀의 높이 설정
        tableView.rowHeight = 120
        
        // 셀의 등록과정⭐️⭐️⭐️ ( 메타타입( 타입 인스턴스 그 자체 ), identifier도 등록 )
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MovieCell")
    }

    func setupDatas() {
        movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
    }
    
    // TableView의 오토레이아웃 설정
    func setupTableViewConstrains(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        
    }
}

extension ViewController: UITableViewDelegate {
    
    
    // 테이블 뷰의 특정한 행이 선택되었을 때의 어떤 동작을 할 것인지 VC에게 물어봄.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 다음 화면으로 이동
        let detailVC = DetailViewController()
        detailVC.movieData = moviesArray[indexPath.row]
        //show(detailVC, sender: nil)
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        
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
