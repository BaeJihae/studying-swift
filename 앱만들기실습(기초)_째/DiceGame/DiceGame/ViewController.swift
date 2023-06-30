//
//  ViewController.swift
//  DiceGame
//
//  Created by 배지해 on 2023/06/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    
    var diceArray : [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    // 앱의 화면에 들어오면 가장 먼저 보이는 화면 뷰
    override func viewDidLoad() {
        super.viewDidLoad()
        firstImageView.image = diceArray[0]
        secondImageView.image = diceArray[0]
    }

    // 함수
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        // 첫번째 뷰의 이미지를 변경
        firstImageView.image = diceArray.randomElement()

        // 두번째 뷰의 이미지를 변경
        secondImageView.image = diceArray.randomElement()
        
        
    }
    
    
    
    
    

}

