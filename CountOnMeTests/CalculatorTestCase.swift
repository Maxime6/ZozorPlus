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
    
    func testGivenStringNumberIsEmpty_WhenSelectedANumber_ThenStringNumberIsUpdate() {
        calculator.addNewNumber(2)
        
        XCTAssert(calculator.stringNumbers == ["2"])
    }
    
    func testGivenANumberIsSelected_WhenUserChooseAddition_ThenOperatorsIsUpdate() {
        calculator.addition()
        
        XCTAssert(calculator.operators == ["+"])
    }
    
    func testGivenANumberIsSelected_WhenUserChooseSubstraction_ThenOperatorsIsUpdate() {
        calculator.operators = [""]
        calculator.substraction()
        
        XCTAssert(calculator.operators == ["-"])
    }
    
    func testGiven_When_Then() {
        
    }
    
}
