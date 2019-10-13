//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Sudip Chitroda on 2019-06-29.
//  Copyright © 2019 Sudip Chitroda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let calculateArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "-", "/", "*", "+"]
    
    var calc = true
    var flag = true

    @IBOutlet weak var Label: UILabel!
    
    func populate(charac:Int){
        var labText = String(Label.text!)
        
        if calc{
            labText = ""
            calc = false
        }
        
        labText = labText + calculateArray[charac]
        Label.text = labText
    }
    
    var option : String?
    var number1 : Double?
    
    
    @IBAction func Equals(_ sender: UIButton) {
        let number2 = Double(Label.text!)
        
        var result : Double?
        
        switch option {
        case "+":
            result = number1! + number2!
        case "-":
            result = number1! - number2!
        case "*":
            result = number1! * number2!
        case "/":
            result = number1! / number2!
        default:
            result = 0.0
        }
        
        Label.text = String(result!)
        calc = true
    }
    @IBAction func NumZero(_ sender: UIButton) {
        populate(charac: sender.tag)
    }
    @IBAction func Ac(_ sender: UIButton) {
        Label.text = calculateArray[sender.tag]
    }
    @IBAction func Neg(_ sender: UIButton) {
        var labText = String(Label.text!)
        var numLabText = Int(Label.text!)
        
        if flag {
            labText = calculateArray[sender.tag] + labText
            flag = false
        }else{
            numLabText = -1 * numLabText!
            Label.text = String(numLabText!)
            flag = true
        }
        
        calc = true
    }
    @IBAction func percent(_ sender: UIButton) {
        var num1 = Double(Label.text!)
        
        num1 = num1!/100.0
        Label.text = String(num1!)
        calc = true
    }
    
    @IBAction func divide(_ sender: UIButton) {
        option = calculateArray[sender.tag]
        number1 = Double(Label.text!)
        
        calc = true
    }
    
}

