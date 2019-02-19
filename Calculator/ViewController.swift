//
//  ViewController.swift
//  Calculator
//
//  Created by Ryan on 2/16/19.
//  Copyright © 2019 Postup. All rights reserved.
//

import Foundation
import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    var calculatorBrain: CalculatorBrain!
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calculatorBrain = CalculatorBrain()
        self.prepareUI()
    }
    
    private func prepareUI() {
        self.displayConfiguration()
    }
    
    func displayConfiguration() {
        self.view.backgroundColor = UIColor.black
        self.display.textColor = .white
    }
    
    
// MARK: - Methods
    @IBAction private func touchDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if self.userIsInTheMiddleOfTyping {
            self.display.text = digit
            self.calculatorBrain.secondNumber = Int(digit)!
        } else {
            self.display.text = digit
            self.userIsInTheMiddleOfTyping = true
            self.calculatorBrain.firstNumber = Int(digit)!
        }
    }
    
    @IBAction private func clearAll() {
        
        self.display.text = "\(calculatorBrain.firstNumber)"
        self.calculatorBrain.clear()
        self.userIsInTheMiddleOfTyping = false
    }
    
    @IBAction func symbolPressed(_ sender: UIButton) {
        
        let mathematicalSymbol = sender.currentTitle
        self.calculatorBrain.selectedSymbol = mathematicalSymbol
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        if self.calculatorBrain.selectedSymbol != nil {
            self.display.text = String(self.calculatorBrain.performCalculation(digit1: self.calculatorBrain.firstNumber, digit2: self.calculatorBrain.secondNumber, selectedSymbol: self.calculatorBrain.selectedSymbol!))
            self.calculatorBrain.firstNumber = 0
            self.calculatorBrain.secondNumber = 0
        }
    }
}

