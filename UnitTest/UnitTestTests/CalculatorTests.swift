//
//  CalculatorTests.swift
//  UnitTestTests
//
//  Created by Mobdev on 07-03-22.
//

import Foundation
import XCTest
@testable import UnitTest


class CalculatorTest: XCTestCase{
    var sut: Calculator!
    
    override func setUp() {
        print("xxxx setUp()")
        sut = Calculator ()
    }
    
    override func tearDown() {
        print("xxxx tearDown()")
        sut = nil
    }
 
    func testAddAssert(){
        print("xxxx testAddAssert()")

        XCTAssertEqual(30, sut.plusNumbers(n1: 10, n2: 20))
    }
    
    func testRestAssert() {
        print("xxxx testRestAssert()")
        XCTAssertEqual(10, sut.minusNumbers(n1: 20, n2: 10))

    }

    func testMultAssert() {
        print("xxxx testMultAssert()")
        XCTAssertEqual(2000, sut.multNumbers(n1: 20, n2: 100))

    }
    func testDivAssert() {
        print("xxxx testDivAssert()")
        XCTAssertEqual(5, try sut.divNumbers(n1: 10, n2: 2))

    }
    
    func testDivThrowsAssert() {
        print("xxxx testDivThrowsAssert()")
        XCTAssertThrowsError( try sut.divNumbers(n1: 10, n2: 0))
        
    }


}
