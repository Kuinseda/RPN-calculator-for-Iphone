//
//  CalculatorEngine.swift
//  CalculatorRPN
//
//  Created by Starrk on 04/03/2016.
//  Copyright © 2016 Starrk. All rights reserved.
//

import Foundation
import UIKit

class CalculatorEngine:NSObject
    
{
    var operandStack = Array<Double>()
    
    func updateStackWithValue(value: Double)
    {
        self.operandStack.append(value)
    }
    //take operation, perform it, put on view controller
    func operate(operation: String) -> Double
    {
        //works out what is pressed, performs an operation and returns a value
        switch operation
        {
        case "✖️":
            if operandStack.count >= 2
            {
                return self.operandStack.removeLast() * self.operandStack.removeLast()
            }
            
        case "➗":
            if operandStack.count >= 2
            {
                return self.operandStack.removeFirst() / self.operandStack.removeLast()
            }
            
        case "➕":
            if operandStack.count >= 2
            {
                return self.operandStack.removeLast() + self.operandStack.removeLast()
            }
            
        case "➖":
            if operandStack.count >= 2
            {
                return self.operandStack.removeFirst() - self.operandStack.removeLast()
            }
            
        case "C":
            if operandStack.count >= 1
            {
               operandStack.removeLast()
                
            }
        case "AC":
            if operandStack.count >= 1
            {
                 operandStack.removeAll()
                
            }
        case "+/-":
            if operandStack.count >= 1
            {
                let min = -1.0
                return (self.operandStack.removeLast() * min)
            }
        case "1/x":
            if operandStack.count >= 1
            {
                let nu = 1.0
                return (nu / self.operandStack.removeLast())
            }
        case "X²":
            if operandStack.count >= 1
            {
                let sq = self.operandStack.removeLast()
                return (sq * sq)
            }
        case "√":
            if operandStack.count >= 1
            {
                return sqrt(self.operandStack.removeLast())
            }
        case "sin":
            if operandStack.count >= 1
            {
                return sin(self.operandStack.removeLast())
            }
        case "cos":
            if operandStack.count >= 1
            {
                return cos(self.operandStack.removeLast())
            }
        case "tan":
            if operandStack.count >= 1
            {
                return tan(self.operandStack.removeLast())
            }
        case "log₁₀":
            if operandStack.count >= 1
            {
                return log10(self.operandStack.removeLast())
            }
        case "logₑ":
            if operandStack.count >= 1
            {
                return log(self.operandStack.removeLast())
            }
        case "arcsin":
            if operandStack.count >= 1
            {
                return asin(self.operandStack.removeLast())
            }
        case "arccos":
            if operandStack.count >= 1
            {
                return acos(self.operandStack.removeLast())
            }
        case "arctan":
            if operandStack.count >= 1
            {
                return atan(self.operandStack.removeLast())
            }
            
        default:break
        }
        return 0.0
    }
}