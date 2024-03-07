//
//  Member.swift
//  MemberListApp_eighth
//
//  Created by 배지해 on 2/5/24.
//

import UIKit

// 데이터와 관련된 모델
struct Member {
    
    // 이미지
    lazy var memberImage: UIImage? = {
        // 이름이 없을 때 기본 이미지 세팅
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        // 해당 이름과 대응되는 이미지가 없을 때 기본 이미지 세팅
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    // 멤버의 (절대적) 순서를 위한 타입 저장 속성
    static var memberNumbers: Int = 0
    
    let memberID: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    // struct는 멤버 와이즈 이니셜라이저가 자동으로 구현이 되어 생성자를 구현하지 않아도 됨.
    
    // 근데 생성자를 직접 구현한 이유는 memberNumbers의 구현을 위해
    init(name: String?, age: Int?, phone: String?, address: String?) {
        
        self.memberID = Member.memberNumbers
        
        // 나머지 저장속성은 외부에서 셋팅
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        // 멤버를 생성한다면, 항상 타입 저장속성의 정수값을 1 증가
        Member.memberNumbers += 1
    }
}
