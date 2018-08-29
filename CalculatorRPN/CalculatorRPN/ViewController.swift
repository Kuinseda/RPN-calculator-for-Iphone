//
//  ViewController.swift
//  CalculatorRPN
//
//  Created by Starrk on 03/03/2016.
//  Copyright © 2016 Starrk. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {

    @IBOutlet weak var labelDisplay: UILabel!
    @IBOutlet weak var modeDisplay: UILabel!
    @IBOutlet weak var operandDisplay: UILabel!
    
    
    var calcEngine : CalculatorEngine?
    let pi = 3.14159265
    var decimalMode = true
    var radsMode = false
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.calcEngine == nil {
            self.calcEngine = CalculatorEngine()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var userHasStartedTyping = false
    
    @IBAction func digitPressed(sender: UIButton) {
        
        let digit = sender.currentTitle!
        print("digit pressed = \(digit)")
        if userHasStartedTyping {
            labelDisplay.text = labelDisplay.text! + "\(digit)"

        }else{
            labelDisplay.text = digit
            userHasStartedTyping = true
            //if the user hasnt started typing erase 0 with the digit pressed
        }
        
    }
    
    @IBAction func decimal(sender: UIButton) {
        
        let deci = "."
        print("pressed = \(deci)")
        if userHasStartedTyping {
            labelDisplay.text = labelDisplay.text! + "\(deci)"
        }
        
    }
    
    @IBAction func pi(sender: UIButton) {
        let π = M_PI
        if userHasStartedTyping {
            labelDisplay.text = labelDisplay.text! + "\(π)"
        }else{
            labelDisplay.text = "\(π)"
            userHasStartedTyping = true
        }
        
        
    }
   
    var displayValue : Double
        {
        
        get{
            return (NSNumberFormatter().numberFromString(labelDisplay.text!)?.doubleValue)!
        }
        set(newValue)
        {
            let π = pi
            if decimalMode {
                labelDisplay.text = "\(newValue)"
                userHasStartedTyping = false
            }else {
                
                labelDisplay.text = "\(newValue * (180/π))"
                userHasStartedTyping = false
            }
            
        }
    }
    
     @IBAction func minus(sender: UIButton) {
        let num = self.displayValue
        labelDisplay.text = "\(num * -1.0)"
    }
    
    
    @IBAction func mode(sender: AnyObject) {
        if decimalMode {
            radsMode = true
            modeDisplay.text = "Decimal"
            decimalMode = false
            
        }else{
            decimalMode = true
            modeDisplay.text = "Radians"
        }
        
    }
    
    @IBAction func enter() {
       // let enter = "⏎"
            userHasStartedTyping = false
             self.calcEngine!.operandStack.append(displayValue)
        
            //labelDisplay.text = labelDisplay.text! + "\(enter)"
            //call the display value property, run the getter, return the double text value.
        
            operandDisplay.text =  "\(self.calcEngine!.operandStack)"
            print("Operand Stack on engine = \(self.calcEngine!.operandStack)")
            //every time enter is pressed, displays numbers on the stack in the output.
            
        
    }
    func tapeHist(history: String)
    {
        operandDisplay.text = operandDisplay.text! + history
    }
    
    @IBAction func Operation(sender: UIButton) {
        
        let operation = sender.currentTitle!
        
        if userHasStartedTyping{
            
            enter()
            
        }
        self.displayValue = (self.calcEngine?.operate(operation))!
        tapeHist(operation)
        enter()
    }
    
    var saveHist = Array<String>()
    var saveSegHist = Array<String>()
    var save = Array<String>()
    var temp = Array<String>()
    
    @IBAction func tape(sender: AnyObject) {
        saveHist.append(operandDisplay.text!)
        //save operand to saveHist array
        print(saveHist)
        
        save = defaults.objectForKey("HKey") as? [String] ?? [String]()
        for savefile in save{
            saveHist.append(savefile)
        }
        defaults.setValue(saveHist, forKey: "HKey")
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            //let secondVC: SecondViewController = segue.destinationViewController as! SecondViewController
            
        saveSegHist = defaults.objectForKey("HKey") as? [String] ?? [String]()
        print("Prepare Segue \(saveSegHist)")
        
     
        if segue.identifier == "push"
        {
            for savefile in saveSegHist
            {
                print("To savefile" + savefile)
                temp.append(savefile)
                let tapeDisp: SecondViewController = segue.destinationViewController as! SecondViewController
                tapeDisp.files = self.temp
            }
        }else{
            print("why you no work")
        }
    }
    
 

}

