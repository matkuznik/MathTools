//
//  StandardScoreNormalizatorTests.swift
//  MathToolsTests
//
//  Created by Mateusz Kuznik on 15/08/2018.
//

import XCTest
import MathTools

class StandardScoreNormalizatorTests: XCTestCase {

    func testThatNormalized_forEmptyArray_willReturnsEmptyArray() {
        
        let expectedArray: [Double] = []
        let arrayToNormalize: [Double] = []
        
        let sut = StandardScoreNormalizator<Double>(epsilon: 0.000001)
        
        let normalizedArray = sut.normalized(arrayToNormalize)
        
        XCTAssertEqual(normalizedArray, expectedArray)
    }
    
    func testThatNormalized_forArrayWithTheSameValues_willReturnsArrayWithOnlyZeros() {
        
        let expectedArray = [0.0, 0.0, 0.0, 0.0]
        let arrayToNormalize = [100.0, 100.0, 100.0, 100.0]
        
        let sut = StandardScoreNormalizator<Double>(epsilon: 0.000001)
        
        let normalizedArray = sut.normalized(arrayToNormalize)
        
        XCTAssertEqual(normalizedArray, expectedArray)
    }
    
    func testThatNormalized_forArrayWithDifferentValues_willReturnsArrayWithCorrect() {
        
        let expectedArray = [-0.38596489, -0.10526315,  0.24561402,  0.24561402]
        let arrayToNormalize = [1.0, 5.0, 10.0, 10.0]
        
        
        let sut = StandardScoreNormalizator<Double>(epsilon: 0.000001)
        
        let normalizedArray = sut.normalized(arrayToNormalize)
        
        zip(normalizedArray, expectedArray).forEach { (touple) in
            let (value, expected) = touple
            XCTAssertEqual(value, expected, accuracy: 0.00000001)
        }
    }

}

extension StandardScoreNormalizatorTests {
    static var allTests = [
        ("testThatNormalized_forEmptyArray_willReturnsEmptyArray", testThatNormalized_forEmptyArray_willReturnsEmptyArray),
        ("testThatNormalized_forArrayWithTheSameValues_willReturnsArrayWithOnlyZeros", testThatNormalized_forArrayWithTheSameValues_willReturnsArrayWithOnlyZeros),
        ("testThatNormalized_forArrayWithDifferentValues_willReturnsArrayWithCorrect", testThatNormalized_forArrayWithDifferentValues_willReturnsArrayWithCorrect)
    ]
}
