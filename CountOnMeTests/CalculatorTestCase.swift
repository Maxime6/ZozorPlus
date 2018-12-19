//
//  CalculatorTestCase.swift
//  CountOnMeTests
//
//  Created by Yves TANTER on 01/12/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest

@testable import CountOnMe

class CalculatorTestCase: XCTestCase {
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    // Testing if user can't add an operator
    func testGivenThereIsNoNumber_WhenUserAddAnOperator_ThenHeCantAddOperator() {
        XCTAssertFalse(calculator.canAddOperator)
    }
    
    // Testing if user can add an operator
    func testGivenThereIsNoCalcul_WhenUserAddANumber_ThenHeCanAddOperator() {
        let _ = calculator.addNewNumber(1)
        XCTAssertTrue(calculator.canAddOperator)
    }
    
    // Substraction calculation test
    func testGivenThereIsNoCalcul_WhenUserMakeASubstraction_ThenCalculateTotal() {
        let _ = calculator.addNewNumber(1)
        let _ = calculator.substraction()
        let _ = calculator.addNewNumber(1)
        
        XCTAssertEqual(calculator.calculateTotal(), "0.0")
    }
    
    // Expression is incorrect when calcul is not finish
    func testGivenACalculIsNotCompleted_WhenCalculateTotal_ThenExpressionIsIncorrect() {
        let _ = calculator.addNewNumber(2)
        let _ = calculator.addition()
        let _ = calculator.calculateTotal()
        
        XCTAssertFalse(calculator.isExpressionCorrect)
    }
    
    // Expression is inorrect after two calculate total
    func testGivenCalculateTotal_WhenCalculateTotalAgain_ThenExpressionIsIncorrect() {
        let _ = calculator.addNewNumber(2)
        let _ = calculator.addition()
        let _ = calculator.addNewNumber(1)
        let _ = calculator.calculateTotal()
        let _ = calculator.calculateTotal()
        
        XCTAssertFalse(calculator.isExpressionCorrect)
    }
    
    // Square root calculation test
    func testGivenMakeAnAddition_WhenSquareRoot_ThenCalculateTotal() {
        let _ = calculator.addNewNumber(5)
        let _ = calculator.addition()
        let _ = calculator.addNewNumber(20)
        
        XCTAssertEqual(calculator.calculateSquareRoot(), "5.0")
    }
    
    // Square root expression incorrect test
    func testGivenAddAnOperatorPlusOrMinus_WhenSquareRoot_ThenExpressionIsIncorrect() {
        let _ = calculator.addNewNumber(5)
        let _ = calculator.substraction()
        let _ = calculator.calculateSquareRoot()
        
        XCTAssertFalse(calculator.isExpressionCorrect)
    }
    
}
