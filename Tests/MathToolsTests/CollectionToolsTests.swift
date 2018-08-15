//
//  CollectionToolsTests.swift
//  MathToolsTests
//
//  Created by Mateusz Kuznik on 15/04/2018.
//

import XCTest
import MathTools

class CollectionToolsTests: XCTestCase {
    
  
    func testThatSum_forEmptyArray_willReturnZero() {
        let expectedValue: Double = 0
        
        let value = [Double]().sum()
        
        XCTAssertEqual(value, expectedValue)
    }
    
    func testThatSum_forNotEmptyArray_willReturnSum() {
        let expectedValue: Double = 17
        
        let value = [10.0, 2.0, 5.0].sum()
        
        XCTAssertEqual(value, expectedValue)
    }
    
    func testThatMean_forEmptyArray_willReturnNaN() {
        let value = [Double]().mean()
        XCTAssertTrue(value.isNaN)
    }
    
    func testThatMean_forNonEmptyArray_willReturnMeanOfAllValues() {
        let expectedValue: Double = 5
        
        let value = [10.0, 2.0, 5.0, 3.0].mean()
        
        XCTAssertEqual(value, expectedValue)
    }
    
    func testThatVariance_forNonEptyArray_willReturnVarinaceOfAllValues() {
        let expectedValue: Double = 21704
        
        let value = [206.0, 76.0, -224.0, 36.0, -94.0].variance()
        
        XCTAssertEqual(value, expectedValue)
    }
}

extension CollectionToolsTests {
    static var allTests = [
        ("testThatSum_forEmptyArray_willReturnZero", testThatSum_forEmptyArray_willReturnZero),
        ("testThatSum_forNotEmptyArray_willReturnSum", testThatSum_forNotEmptyArray_willReturnSum),
        ("testThatMean_forEmptyArray_willReturnNaN", testThatMean_forEmptyArray_willReturnNaN),
        ("testThatMean_forNonEmptyArray_willReturnMeanOfAllValues", testThatMean_forNonEmptyArray_willReturnMeanOfAllValues),
        ("testThatVariance_forNonEptyArray_willReturnVarinaceOfAllValues", testThatVariance_forNonEptyArray_willReturnVarinaceOfAllValues),
        ("testThatVariance_forNonEptyArray_willReturnVarinaceOfAllValues", testThatVariance_forNonEptyArray_willReturnVarinaceOfAllValues)
    ]
}
