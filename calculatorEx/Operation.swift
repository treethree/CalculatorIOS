//
//  Addition.swift
//  calculatorEx
//
//  Created by SHILEI CUI on 3/8/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import Foundation

struct Operation{
    func addTwoNumber(num1 : Double, num2 : Double)->Double{
        return num1 + num2
    }
    func substractNumber(num1 : Double, num2: Double)->Double{
        return num1 - num2
    }
    func multiNumber(num1 : Double, num2: Double)->Double{
        return num1 * num2
    }
    func divideNumber(num1 : Double, num2: Double)->Double{
        if num2 == 0{
            print("Can't divide by 0")
        }
        return num1 / num2
    }
}
