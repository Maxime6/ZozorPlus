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
    
    func testGivenThereIsNoNumber_WhenUserAddAnOperator_ThenHeCantAddOperator() {
        XCTAssertFalse(calculator.canAddOperator)
    }
    
    func testGivenThereIsNoCalcul_WhenUserAddANumber_ThenHeCanAddOperator() {
        let _ = calculator.addNewNumber(1)
        XCTAssertTrue(calculator.canAddOperator)
    }
    
    func testGivenThereIsNoCalcul_WhenUserMakeASubstraction_ThenCalculateTotal() {
        let _ = calculator.addNewNumber(1)
        let _ = calculator.substraction()
        let _ = calculator.addNewNumber(1)
        
        XCTAssertEqual(calculator.calculateTotal(), "0.0")
    }
    
    func testGivenACalculIsNotCompleted_WhenCalculateTotal_ThenExpressionIsIncorrect() {
        let _ = calculator.addNewNumber(2)
        let _ = calculator.addition()
        let _ = calculator.calculateTotal()
        
        XCTAssertFalse(calculator.isExpressionCorrect)
    }
    
    func testGivenCalculateTotal_WhenCalculateTotalAgain_ThenExpressionIsCorrect() {
        let _ = calculator.addNewNumber(2)
        let _ = calculator.addition()
        let _ = calculator.addNewNumber(1)
        let _ = calculator.calculateTotal()
        let _ = calculator.calculateTotal()
        
        XCTAssertFalse(calculator.isExpressionCorrect)
    }
    
    func testGivenMakeAnAddition_WhenSquareRoot_ThenCalculateTotal() {
        let _ = calculator.addNewNumber(5)
        let _ = calculator.addition()
        let _ = calculator.addNewNumber(20)
        
        XCTAssertEqual(calculator.calculateSquareRoot(), "5.0")
    }
    
    func testGivenAddAnOperatorPlusOrMinus_WhenSquareRoot_ThenExpressionIsIncorrect() {
        let _ = calculator.addNewNumber(5)
        let _ = calculator.substraction()
        let _ = calculator.calculateSquareRoot()
        
        XCTAssertFalse(calculator.isExpressionCorrect)
    }
    
}
