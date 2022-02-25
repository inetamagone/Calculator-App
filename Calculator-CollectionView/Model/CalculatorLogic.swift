//
//  CalculatorLogic.swift
//  Calculator-App
//
//  Created by ineta.magone on 25/02/2022.
//

import UIKit

class CalculatorLogic {
    
    // MARK: - Variables
    
    var items = [String]()
    var numberExists: Bool = false
    var operandExists: Bool = false
    
    // MARK: - Enum of operands
    
    enum Operands : String {
        case plus = "+"
        case minus = "-"
        case divide = "/"
        case multiply = "*"
    }
    
    // MARK: - Methods
    
    func displayText(screenText: UILabel) {
        screenText.text = items.joined(separator: "")
    }
    
    func numberTapped(screenText: UILabel, number: String) {
        numberExists = true
        items.append(number)
        displayText(screenText: screenText)
    }
    
    func operandTapped(screenText: UILabel, operand: String) {
        operandExists = true
        items.append(operand)
        displayText(screenText: screenText)
    }
    
//    func equalTapped(screenText: UILabel) {
//        calculate(screenText: <#T##UILabel#>, a: <#T##Int#>, b: <#T##Int#>)
//        items.removeAll()
//        screenText.text = result
//    }
    
    func clearTapped(screenText: UILabel) {
        numberExists = false
        operandExists = false
        items.removeAll()
        screenText.text = "0"
    }
    
    
    func calculate(screenText: UILabel, a: Int, b: Int) -> Int {
//        Int(items[0]) = a
//        Int(items[2]) = b
        var result: Int = 0
        switch Operands(rawValue: "") {
            
        case .plus:
            result = a + b
        case .minus:
            result = a - b
        case .divide:
            result = a / b
        case .multiply:
            result = a * b
            
        case .none:
            print("Enter the values")
        }
        screenText.text = String(result)
        return result
    }
    
//    func checkExpression() {
//        var checkExpression: Bool = false
//        if numberExists == true || operandExists == true || items.count >= 3 ||
//            items[0] == "0" || "1" || "2" || "3" || "4" || "5" || "6" || "7" || "8" || "9" {
//            checkExpression = true
//        }
//    }
}
