//
//  ViewController.swift
//  MemberListApp_eighth
//
//  Created by 배지해 on 2/5/24.
//

import UIKit

final class ViewController: UIViewController {
    
    // 테이블 뷰
    private let tableView = UITableView()
    
    var memberListManager = MemberListManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupDatas()
        setupTableView()
        setupNaviBar()
        setupTableViewConstaints()
    }
    
    // 네비게이션 바의 오토레이아웃 설정
    func setupNaviBar() {
        
        // 네비게이션 바의 제목 설정
        title = "회원 목록"
        
        // 네비게이션 바 설정 관련
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // 불투명으로
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // 네비게이션바 오른쪽 상단 버튼 설정
        //self.navigationItem.rightBarButtonItem = self.plusButton
    }
    
    func setupTableView() {
        tableView.dataSource = self
        
        // cell의 높이 설정 
        tableView.rowHeight = 60
        
        // 메타타입??!?!?
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    func setupDatas() {
        memberListManager.makeMembersListDatas() // 일반적으로는 서버에 요청
    }
    
    // 테이블 뷰의 오토레이아웃 설정
    func setupTableViewConstaints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMemberList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MyTableViewCell
        
        cell.mainImageView.image = memberListManager[indexPath.row].memberImage
        cell.memberNameLabel.text = memberListManager[indexPath.row].name
        cell.addressLabel.text = memberListManager[indexPath.row].address
        
        cell.selectionStyle = .none
        
        return cell
    }

}
