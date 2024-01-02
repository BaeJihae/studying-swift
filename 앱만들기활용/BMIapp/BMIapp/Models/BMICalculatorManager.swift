//
//  BMICalculatorManager.swift
//  BMIapp
//
//  Created by 배지해 on 1/2/24.
//

import Foundation
import UIKit

struct BMICalculatorManager {
    
    // BMI 계산 결과값 보관을 위한 변수
    private var bmi: BMI?
    
    mutating func getBMI(weight: String, height: String) -> BMI {
        calculateBMI(height: height, weight: weight)
        return bmi ?? BMI(value: 0.0, matchColor: UIColor.white, advice: "오류")
    }
    
    mutating private func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = BMI(value: 0.0, matchColor: UIColor.white, advice: "오류")
            return
        }
        var bmiNum = w / ( h * h ) * 10000
        bmiNum = round(bmiNum * 10) / 10
        
        switch bmiNum {
        case ..<18.6:
            let color = UIColor(displayP3Red: 22/255,
                                green: 231/255,
                                blue: 107/255,
                                alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "저체중")
            
        case 18.6..<23.0:
            let color = UIColor(displayP3Red: 212/255,
                                green: 251/255,
                                blue: 121/255,
                                alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "표준")
            
        case 23.0..<25.0:
            let color = UIColor(displayP3Red: 218/255,
                                green: 127/255,
                                blue: 163/255,
                                alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "과체중")
            
        case 25.0..<30.0:
            let color = UIColor(displayP3Red: 255/255,
                                green: 150/255,
                                blue: 141/255,
                                alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "비만")
            
        case 30.0...:
            let color = UIColor(displayP3Red: 255/255,
                                green: 100/255,
                                blue: 78/255,
                                alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "고도비만")
            
        default :
            bmi = BMI(value: 0.0, matchColor: UIColor.white, advice: "오류")
        }
    }
}
