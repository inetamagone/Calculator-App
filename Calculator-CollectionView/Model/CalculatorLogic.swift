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
    var itemsJoined: String {
        return items.joined()
    }
    var numberExists: Bool = false
    var operandExists: Bool = false
    var resultExists: Bool = false
    
    var lastElementIsOperand: Bool {
        guard let lastElement = items.last else { return false }
        return lastElement == "+" || lastElement == "-" || lastElement == "*" || lastElement == "/"
    }
    var lastElementIsNumber: Bool {
        guard let lastElement = itemsJoined.last else { return false }
        return lastElement.isNumber == true
    }
    
    // MARK: - Methods
    
    func displayText(screenText: UILabel) {
        screenText.text = items.joined(separator: "")
    }
    
    func joiningNumbers(nextElement: String) {
        if lastElementIsNumber == true && resultExists == false {
            guard let lastElement = items.last else { return }
            let joinedElement = lastElement + nextElement
            items.removeLast()
            items.append(joinedElement)
        }
    }
    
    func numberTapped(screenText: UILabel, number: String) {
        numberExists = true
        if lastElementIsNumber == true && resultExists == false  {
            joiningNumbers(nextElement: number)
        } else if lastElementIsNumber == true && resultExists == true {
            displayText(screenText: screenText)
        } else {
            items.append(number)
        }
        displayText(screenText: screenText)
    }
    
    func operandTapped(screenText: UILabel, operand: String) {
        if numberExists == true && operandExists == false && lastElementIsNumber == true {
            operandExists = true
            items.append(operand)
            resultExists = false
            displayText(screenText: screenText)
        } else if operandExists == true && lastElementIsNumber == true {
            calculate()
            operandExists = true
            items.append(operand)
            resultExists = false
            displayText(screenText: screenText)
        } else if lastElementIsOperand == true {
            displayText(screenText: screenText)
        } else {
            screenText.text = "0"
        }
    }
    
    func equalTapped(screenText: UILabel) {
        if numberExists == true && operandExists == true && lastElementIsNumber == true {
            calculate()
            displayText(screenText: screenText)
        } else if lastElementIsOperand == true {
            displayText(screenText: screenText)
        } else if resultExists == true {
            displayText(screenText: screenText)
        } else {
            screenText.text = "0"
            items.removeAll()
        }
    }
    
    func clearTapped(screenText: UILabel) {
        numberExists = false
        operandExists = false
        resultExists = false
        items.removeAll()
        screenText.text = "0"
    }
    
    func calculate() {
        guard let a = Double(items[0]) else { return }
        guard let b = Double(items[2]) else { return }
        let operand = items[1]
        var result: Double = 0
        
        switch operand {
        case "+": result = a + b
        case "-": result = a - b
        case "*": result = a * b
        case "/": result = a / b
        default: return
        }
        items.removeAll()
        let formattedResult = formatResult(result)
        items.append(String(formattedResult))
        operandExists = false
        resultExists = true
    }
    
    func formatResult(_ result: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        guard let formatedResult = formatter.string(from: NSNumber(value: result)) else { return String() }
        return formatedResult
    }
    
}
