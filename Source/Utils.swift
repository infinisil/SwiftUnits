//
//  Utils.swift
//  SwiftUnits
//
//  Created by Silvan Mosberger on 17/05/16.
//
//

private let superscriptNumbers : [Character] =
	["⁰", "¹", "²", "³", "⁴", "⁵", "⁶", "⁷", "⁸", "⁹"]

extension IntegerArithmetic where Self : SignedNumber {
	/// Converts a number to its superscript variant. (-42).superscript = "⁻⁴²"
	public var superscript : String {
		var n = self
		var chars : [Character] = []
		repeat {
			let r = n % 10
			n = n / 10
			let index = Int(abs(r).toIntMax())
			chars.append(superscriptNumbers[index])
		} while n != 0
		
		if self < 0 { chars.append("⁻") }
		
		return String(chars.reversed())
	}
}
