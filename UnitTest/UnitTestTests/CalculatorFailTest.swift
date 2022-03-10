//
//  CalculatorFailTest.swift
//  UnitTestTests
//
//  Created by Mobdev on 09-03-22.
//

import Foundation

import XCTest
@testable import UnitTest


class CalculatorFailTest: XCTestCase{
    var sut: CalculatorFail!
    
    override func setUp() {
        print("xxxx setUp()")
        sut = CalculatorFail ()
    }
    
    override func tearDown() {
        print("xxxx tearDown()")
        sut = nil
    }
    
    func testDivAssert() {
        print("xxxx testDivAssert()")

        XCTAssertEqual(5, sut.divNumbers(n1: 10, n2: 2))
    }
    func testDivZeroAssert() {
        print("xxxx testDivAssert()")

        XCTAssertEqual(0, sut.divNumbers(n1: 10, n2: 0))
    }
}
    
    
    
    
    
    

