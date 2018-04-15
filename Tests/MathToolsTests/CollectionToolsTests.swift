//
//  CollectionToolsTests.swift
//  MathToolsTests
//
//  Created by Mateusz Kuznik on 15/04/2018.
//

import XCTest
import MathTools

class CollectionToolsTests: XCTestCase {
    
    func testThatNormalized_forEmptyArray_willReturnsEmptyArray() {
        
        
        let expectedArray: [Double] = []
        let arrayToNormalize: [Double] = []
        
        let normalizedArray = arrayToNormalize.normalized()
        
        XCTAssertEqual(normalizedArray, expectedArray)
    }
    
    func testThatNormalized_forArrayWithTheSameValues_willReturnsArrayWithOnlyZeros() {
        
        
        let expectedArray = [0.0, 0.0, 0.0, 0.0]
        let arrayToNormalize = [100.0, 100.0, 100.0, 100.0]
        
        let normalizedArray = arrayToNormalize.normalized()
        
        XCTAssertEqual(normalizedArray, expectedArray)
    }
    
    func testThatNormalized_forArrayWithDifferentValues_willReturnsArrayWithCorrectValues() {
        
        
        let expectedArray = [1.0, 0.5, 0.25, 0.0]
        let arrayToNormalize = [100.0, 50.0, 25.0, 0.0]
        
        let normalizedArray = arrayToNormalize.normalized()
        
        XCTAssertEqual(normalizedArray, expectedArray)
    }
    
    func testThatStandardScoreNormalized_forEmptyArray_willReturnsEmptyArray() {
        
        
        let expectedArray: [Double] = []
        let arrayToNormalize: [Double] = []
        
        let normalizedArray = arrayToNormalize.standardScoreNormalized()
        
        XCTAssertEqual(normalizedArray, expectedArray)
    }
    
    func testThatStandardScoreNormalized_forArrayWithTheSameValues_willReturnsArrayWithOnlyZeros() {
        
        
        let expectedArray = [0.0, 0.0, 0.0, 0.0]
        let arrayToNormalize = [100.0, 100.0, 100.0, 100.0]
        
        let normalizedArray = arrayToNormalize.standardScoreNormalized()
        
        XCTAssertEqual(normalizedArray, expectedArray)
    }
    
    func testThatStandardScoreNormalized_forArrayWithDifferentValues_willReturnsArrayWithCorrect() {
        
        
        let expectedArray = [-0.38596489, -0.10526315,  0.24561402,  0.24561402]
        let arrayToNormalize = [1.0, 5.0, 10.0, 10.0]
        
        let normalizedArray = arrayToNormalize.standardScoreNormalized()
        
        zip(normalizedArray, expectedArray).forEach { (touple) in
            let (value, expected) = touple
            XCTAssertEqual(value, expected, accuracy: 0.00000001)
        }
        
        
        
    }
    
}

extension CollectionToolsTests {
    static var allTests = [
        ("testThatNormalized_forEmptyArray_willReturnsEmptyArray", testThatNormalized_forEmptyArray_willReturnsEmptyArray),
        ("testThatNormalized_forArrayWithTheSameValues_willReturnsArrayWithOnlyZeros", testThatNormalized_forArrayWithTheSameValues_willReturnsArrayWithOnlyZeros),
        ("testThatNormalized_forArrayWithDifferentValues_willReturnsArrayWithCorrectValues", testThatNormalized_forArrayWithDifferentValues_willReturnsArrayWithCorrectValues),
        ("testThatStandardScoreNormalized_forEmptyArray_willReturnsEmptyArray", testThatStandardScoreNormalized_forEmptyArray_willReturnsEmptyArray),
        ("testThatStandardScoreNormalized_forArrayWithTheSameValues_willReturnsArrayWithOnlyZeros", testThatStandardScoreNormalized_forArrayWithTheSameValues_willReturnsArrayWithOnlyZeros),
        ("testThatStandardScoreNormalized_forArrayWithDifferentValues_willReturnsArrayWithCorrect", testThatStandardScoreNormalized_forArrayWithDifferentValues_willReturnsArrayWithCorrect),
        ]
}
