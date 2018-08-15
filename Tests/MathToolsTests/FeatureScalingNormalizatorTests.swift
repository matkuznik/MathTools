//
//  FeatureScalingNormalizatorTests.swift
//  MathToolsTests
//
//  Created by Mateusz Kuznik on 15/08/2018.
//

import XCTest
import MathTools

class FeatureScalingNormalizatorTests: XCTestCase {

    func testThatNormalized_forEmptyArray_willReturnsEmptyArray() {
        
        
        let expectedArray: [Double] = []
        let arrayToNormalize: [Double] = []
        
        let normalizator = FeatureScalingNormalizator<Double>()
        let normalizedArray = normalizator.normalized(arrayToNormalize)
        
        XCTAssertEqual(normalizedArray, expectedArray)
    }
    
    func testThatNormalized_forArrayWithTheSameValues_willReturnsArrayWithOnlyZeros() {
        
        
        let expectedArray = [0.0, 0.0, 0.0, 0.0]
        let arrayToNormalize = [100.0, 100.0, 100.0, 100.0]
        
        let normalizator = FeatureScalingNormalizator<Double>()
        let normalizedArray = normalizator.normalized(arrayToNormalize)
        
        XCTAssertEqual(normalizedArray, expectedArray)
    }
    
    func testThatNormalized_forArrayWithDifferentValues_willReturnsArrayWithCorrectValues() {
        
        
        let expectedArray = [1.0, 0.5, 0.25, 0.0]
        let arrayToNormalize = [100.0, 50.0, 25.0, 0.0]
        
        let normalizator = FeatureScalingNormalizator<Double>()
        let normalizedArray = normalizator.normalized(arrayToNormalize)
        
        XCTAssertEqual(normalizedArray, expectedArray)
    }

}

extension FeatureScalingNormalizatorTests {
    static var allTests = [
        ("testThatNormalized_forEmptyArray_willReturnsEmptyArray", testThatNormalized_forEmptyArray_willReturnsEmptyArray),
        ("testThatNormalized_forArrayWithTheSameValues_willReturnsArrayWithOnlyZeros", testThatNormalized_forArrayWithTheSameValues_willReturnsArrayWithOnlyZeros),
        ("testThatNormalized_forArrayWithDifferentValues_willReturnsArrayWithCorrectValues", testThatNormalized_forArrayWithDifferentValues_willReturnsArrayWithCorrectValues)
        ]
}
