//
//  Normalizator.swift
//  MathTools
//
//  Created by Mateusz Kuznik on 15/08/2018.
//

import Foundation

public protocol Normalizator {
    associatedtype Element where Element: FloatingPoint
    func normalized(_ collection: [Element]) -> [Element]
}


/**
 Feature scaling is a method used to standardize the range of independent variables or features of data.
 In data processing, it is also known as data normalization and is generally performed during the data preprocessing step.
 [Source](https://en.wikipedia.org/wiki/Feature_scaling)
 
     f(x) = ( x - min(collection) ) / ( max(collection) - min(collection) )
 
 */
public struct FeatureScalingNormalizator<T: FloatingPoint>: Normalizator {
    
    public init () {}
    
    /**
     
     Returns array with normalized values using function:
     
         f(x) = ( x - min(collection) ) / ( max(collection) - min(collection) )
     
     - parameters:
        - collection: An array to normalize
     
     - Returns: An array with normalized values. If all values are the same an array filled with `0` will by returned.
     */
    public func normalized(_ collection: [T]) -> [T]  {
        guard let minimumValue = collection.min(),
            let maximumValue = collection.max() else {
                return []
        }
        
        let diff = maximumValue - minimumValue
        
        if diff == 0 {
            return Array(repeating: 0, count: collection.count)
        }
        
        return collection.map { (element) -> T in
            (element - minimumValue) / diff
        }
    }
}

public struct StandardScoreNormalizator<T: FloatingPoint>: Normalizator {
    
    private let epsilon: T
    
    public init(epsilon: T) {
        self.epsilon = epsilon
    }
    
    public func normalized(_ collection: [T]) -> [T] {
        if collection.count == 0 {
            return []
        }
        
        let meanValue = collection.mean()
        let varianceValue = collection.variance()
        
        let divisor = varianceValue + epsilon
        return collection.map {
            ($0 - meanValue) / divisor
        }
    }
}

