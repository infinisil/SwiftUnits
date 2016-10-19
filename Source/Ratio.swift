//
//  Ratio.swift
//  SwiftUnits
//
//  Created by Silvan Mosberger on 31/07/16.
//  
//

import Foundation

public struct Ratio : ExpressibleByIntegerLiteral, CustomStringConvertible, Equatable {
	public let numerator : Int8
	public let denominator : Int8
	
	public var description: String {
		return "\(numerator) / \(denominator)"
	}
	
	/// Ratio representing `1 / 2`
	public static let ½ = Ratio(numerator: 1, denominator: 2)
	/// Ratio representing `1 / 3`
	public static let ⅓ = Ratio(numerator: 1, denominator: 3)
	/// Ratio representing `1 / 4`
	public static let ¼ = Ratio(numerator: 1, denominator: 4)
	/// Ratio representing `1 / 5`
	public static let ⅕ = Ratio(numerator: 1, denominator: 5)
	
	public var value : Double {
		return Double(numerator) / Double(denominator)
	}
	
	public init(numerator: Int8, denominator: Int8) {
		self.numerator = numerator
		self.denominator = denominator
	}
	
	public init(integerLiteral value: Int8) {
		numerator = value
		denominator = 1
	}
}

public func ==(l: Ratio, r: Ratio) -> Bool {
	return l.numerator == r.numerator && l.denominator == r.denominator
}
