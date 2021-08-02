//
//  ViewController.swift
//  CALCULATOR
//
//  Created by Dev ILI on 26/07/2021.
//

import UIKit

enum Operation: String {
    case Add = "+"
    case subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Null = "null"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLbl: UILabel!
    @IBOutlet weak var btnOne: RoundButton!
    @IBOutlet weak var btnTwo: RoundButton!
    @IBOutlet weak var btnZero: RoundButton!
    @IBOutlet weak var btnthree: RoundButton!
    @IBOutlet weak var btnfour: RoundButton!
    @IBOutlet weak var btnfive: RoundButton!
    @IBOutlet weak var btnsix: RoundButton!
    @IBOutlet weak var btnseven: RoundButton!
    @IBOutlet weak var btneight: RoundButton!
    @IBOutlet weak var btnnine: RoundButton!
    
    var ourstring = ""
    
    var workings:String = ""
    var result1: Int = 0
    var runningnumber: String = ""
    var leftvalue: Double = 0
    var output: Double = 0
    var rightvalue: Double = 0
    var result: Double = 0
    var currentoperation: Operation = .Null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLbl.text = "0"
        btnOne.tag = 1
        btnTwo.tag = 2
        btnZero.tag = 0
        btnthree.tag = 3
        btnfour.tag = 4
        btnfive.tag = 5
        btnsix.tag = 6
        btnseven.tag = 7
        btneight.tag = 8
        btnnine.tag = 9
        
    }
    
    
    @IBAction func numberpressed(_ sender: RoundButton) {
        if runningnumber.count <= 8 {
            runningnumber += "\(sender.tag)"
            outputLbl.text = "\(runningnumber)"
        }
    }
    @IBAction func allclearpressed(_ sender: RoundButton) {
        runningnumber = ""
        leftvalue = 0
        rightvalue = 0
        result = 0
        currentoperation = .Null
        outputLbl.text = "0"
    }
    
    func addToWorkings(value: String) {
        workings = value
        outputLbl.text = runningnumber + workings
    }
    @IBAction func dotpressed(_ sender: RoundButton) {
        
        if runningnumber.count <= 7 {
            runningnumber += "."
            outputLbl.text = runningnumber
        }
    }
    @IBAction func equalpressed(_ sender: RoundButton) {
        operation(operation: currentoperation)
    }
    @IBAction func plusspressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    @IBAction func minuspressed(_ sender: RoundButton) {
        operation(operation: .subtract)
    }
    @IBAction func multipressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    @IBAction func dividepressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    
    func operation(operation: Operation){
        if currentoperation != .Null {
            if runningnumber !=  "" {
                rightvalue = (Double(runningnumber)!)
                runningnumber = ""
                
                if currentoperation == .Add {
                    
                    result = Double(leftvalue) + Double(rightvalue)
                }
                else if currentoperation == .subtract {
                    
                    result = Double(leftvalue) - Double(rightvalue)
                }
                else if currentoperation == .Multiply {
                    
                    result = Double(leftvalue) * Double(rightvalue)
                }
                else if currentoperation == .Divide {
                    
                    result = Double(leftvalue) / Double(rightvalue)
                }
                leftvalue = result
                
                let values = result.removeZerosFromEnd().components(separatedBy: ".")
                let limit = 9 - (values[0].count + 1)
                if values[1].count > limit {
                    let sec = values[1].prefix(limit)
                    outputLbl.text = "\(values[0]).\(sec)"
                } else {
                    outputLbl.text = result.removeZerosFromEnd()
                }
            }
            currentoperation = operation
        }
        else {
            leftvalue = (Double(runningnumber)!)
            runningnumber = ""
            currentoperation = operation
        }
    }
}


extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}
