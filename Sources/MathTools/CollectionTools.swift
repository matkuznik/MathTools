//
//  CollectionTools.swift
//  Dimensional
//
//  Created by Mateusz Kuznik on 31/03/2018.
//

import Foundation

extension Collection where Element == Float {
    
    public func standardScoreNormalized() -> [Element] {
        return standardScoreNormalized(epsilon: 0.000001)
    }
}
extension Collection where Element == Double {
    
    public func standardScoreNormalized() -> [Element] {
        return standardScoreNormalized(epsilon: 0.000001)
    }
}

extension Collection where Element: FloatingPoint {
    
    public func normalized() -> [Element] {
        guard let minimumValue = self.min(),
            let maximumValue = self.max() else {
                return []
        }
        
        let diff = maximumValue - minimumValue
        
        if diff == 0 {
            return Array(repeating: 0, count: count)
        }
        
        return map { (element) -> Element in
            (element - minimumValue) / diff
        }
    }
    
    public func standardScoreNormalized(epsilon: Element) -> [Element] {
        if count == 0 {
            return []
        }
        
        let meanValue = mean()
        let varianceValue = variance()
        let divisor = varianceValue + epsilon
        return map {
            ($0 - meanValue) / divisor
        }
        
    }
    
    public func sum() -> Element {
        return reduce(0, +)
    }
    
    public func mean() -> Element {
        let countFloat: Element = Self.Element(count)
        return self.sum() / countFloat
    }
    
    public func variance() -> Element {
        let meanValue = mean()
        let sumOfSquerDifference = reduce(0) { (result, element) -> Element in
            let difference = element - meanValue
            return result + (difference * difference)
        }
        let countFloat: Element = Self.Element(count)
        return sumOfSquerDifference / countFloat
    }
}


