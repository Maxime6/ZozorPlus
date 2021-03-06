//
//  Calculator.swift
//  CountOnMe
//
//  Created by Yves TANTER on 19/11/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import Foundation

// Protocol for Alerts
protocol DisplayAlert {
    func showAlert(message: String)
    
}

class Calculator {
    
    var displayAlertDelegate: DisplayAlert?
    
    // MARK: - Properties
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    displayAlertDelegate?.showAlert(message: "Démarrez un nouveau calcul !")
                } else {
                    displayAlertDelegate?.showAlert(message: "Entrez une expression correcte !")
                }
                return false
            }
        }
        return true
    }
    
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                displayAlertDelegate?.showAlert(message: "Expression incorrecte !")
                return false
            }
        }
        return true
    }
    
    // MARK: - Methods
    
    // Function addition
    func addition() -> String {
        if canAddOperator {
            operators.append("+")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    
    // Function substraction
    func substraction() -> String {
        if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    
    // Function SquareRoot
    func calculateSquareRoot() -> String {
        if canAddOperator {
            guard let result = Double(calculateTotal()) else { return updateDisplay() }
            clear()
            let squareValue = sqrt(result)
            if let stringNumber = stringNumbers.last {
                var stringNumberMutable = stringNumber
                stringNumberMutable += "\(squareValue)"
                stringNumbers[stringNumbers.count-1] = stringNumberMutable
            }
            return String(squareValue)
        }
        return updateDisplay()
    }
    
    // Add a new number
    func addNewNumber(_ newNumber: Int) -> String {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
        return updateDisplay()
    }
    
    // Calculate the total of the calculation
    func calculateTotal() -> String {
        if !isExpressionCorrect {
            return ""
        }
        
        var total: Double = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Double(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
        clear()
        return String(total)
    }
    
    // Update the display
    func updateDisplay() -> String {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
        return text
    }
    
    // Clear tables of numbers and operators
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
    }
    
}
