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
    
    func testCanAddOperator() {
        XCTAssertFalse(calculator.canAddOperator)
    }
    
    func testCanAddOperatorTrue() {
        let _ = calculator.addNewNumber(1)
        XCTAssertTrue(calculator.canAddOperator)
    }
    
    func testSubstraction() {
        let _ = calculator.addNewNumber(1)
        let _ = calculator.substraction()
        let _ = calculator.addNewNumber(1)
        
        XCTAssertEqual(calculator.calculateTotal(), "0")
    }
    
    func testIsExpressionCorrect() {
        let _ = calculator.addNewNumber(2)
        let _ = calculator.addition()
        let _ = calculator.calculateTotal()
        
        XCTAssertFalse(calculator.isExpressionCorrect)
    }
    
    func testIsExpressionCorrectBis() {
        let _ = calculator.addNewNumber(2)
        let _ = calculator.addition()
        let _ = calculator.addNewNumber(1)
        let _ = calculator.calculateTotal()
        let _ = calculator.calculateTotal()
        
        XCTAssertFalse(calculator.isExpressionCorrect)
    }
    
}
