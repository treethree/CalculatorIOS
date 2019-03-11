//
//  ViewController.swift
//  calculatorEx
//
//  Created by SHILEI CUI on 3/7/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calLabel: UILabel!
    var operation : String = ""
    var curNumber : Double = 0
    var preNumber : Double = 0
    var mathFlag : Bool = false
    var tempNumber : Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func numberBtn(_ sender: UIButton) {
        if calLabel.text == "0"{
            calLabel.text = ""
        }
        if mathFlag == true{
                calLabel.text = String(sender.tag)
                curNumber = Double(calLabel.text!)!
                mathFlag = false
        }else{
            //handle +/-
            if sender.tag == 17{
                calLabel.text = String(Double(calLabel.text!)! * -1)
                curNumber = Double(calLabel.text!)!
            }
            //handle .
            else if sender.tag == 10{
                calLabel.text = calLabel.text! + "."
            }
            else{
            calLabel.text = calLabel.text! + String(sender.tag)
            curNumber = Double(calLabel.text!)!
            }
        }
    }
    @IBAction func operateBtn(_ sender: UIButton) {
        let oInstance = Operation()
        calLabel.text = String(sender.tag)
        switch sender.tag{
        // handle AC
        case 11:
            calLabel.text = "0"
            preNumber = 0
            curNumber = 0
        case 12:
            calLabel.text = "÷"
            preNumber = curNumber
            mathFlag = true
            operation = "÷"
        case 13:
            if operation == "="{
                preNumber = tempNumber
                print(preNumber)
            }else{
                preNumber = curNumber
            }
            calLabel.text = "x"
            
            mathFlag = true
            operation = "x"
        case 14:
            calLabel.text = "-"
            preNumber = curNumber
            mathFlag = true
            operation = "-"
        case 15:
            calLabel.text = "+"
            preNumber = curNumber
            mathFlag = true
            operation = "+"
        //handle %
        case 18:
            mathFlag = true
            calLabel.text = String(Double(curNumber / 100))
            curNumber = Double(curNumber / 100)
        //handle "=" 
        default:
            switch operation{
            case "+":
                    calLabel.text = String(oInstance.addTwoNumber(num1: Double(preNumber), num2: Double(curNumber)))
                    tempNumber = Double(calLabel.text!)!
                    print("tempNumber is : \(tempNumber)")
            case "-":
                calLabel.text = String(oInstance.substractNumber(num1: Double(preNumber), num2: Double(curNumber)))
            case "x":
                calLabel.text = String(oInstance.multiNumber(num1: Double(preNumber), num2: Double(curNumber)))
                //preNumber = Double(calLabel.text!)!
                print("prenumber : \(preNumber), curnumber : \(curNumber)")
                operation = "="
            case "÷":
                calLabel.text = String(oInstance.divideNumber(num1: Double(preNumber), num2: Double(curNumber)))
                default:
                    return
            }
        }
    }
}

