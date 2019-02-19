//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ryan on 2/18/19.
//  Copyright © 2019 Postup. All rights reserved.
//

import Foundation


class CalculatorBrain  {
    
    var selectedSymbol: String? = nil
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    
    
    func performCalculation(digit1: Int, digit2: Int, selectedSymbol: String) -> Int {
        
        var results = 0
        
        switch selectedSymbol {
            case "+":
                results = digit1 + digit2
            case "-":
                results = digit1 - digit2
            case "x":
                results = digit1 * digit2
            case "/":
                results = digit1 / digit2
            default:
                print("Nothing")
        }
        
        return results
    }
    
    func clear() {
        self.firstNumber = 0
        self.secondNumber = 0
    }
}
