//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 배지해 on 2023/04/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        mainLabel.text = "반갑습니다"
//        mainLabel.backgroundColor = UIColor.red
    }

    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        
        mainLabel.text = "안녕하세요"
        myButton.backgroundColor = UIColor.green
        myButton.setTitleColor(UIColor.black, for: UIControl.State.normal)

//        mainLabel.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)

        //mainLabel.textAlignment = NSTextAlignment.right
        
    }


}

