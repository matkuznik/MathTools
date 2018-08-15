//
//  CollectionTools.swift
//  Dimensional
//
//  Created by Mateusz Kuznik on 31/03/2018.
//

import Foundation

extension Collection where Element: FloatingPoint {
    
    public func sum() -> Element {
        return reduce(0, +)
    }
    
    public func mean() -> Element {
        guard count != 0 else {
            return Element.nan
        }
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


