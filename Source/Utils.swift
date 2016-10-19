//
//  Utils.swift
//  SwiftUnits
//
//  Created by Silvan Mosberger on 17/05/16.
//
//



extension Int8 {
	static let superscriptNumbers : [Character] = ["⁰", "¹", "²", "³", "⁴", "⁵", "⁶", "⁷", "⁸", "⁹"]
	
	public var superscript : String {
		var n = self
		var chars : [Character] = []
		repeat {
			let r = n % 10
			n = n / 10
			chars.append(Int8.superscriptNumbers[Int(abs(r))])
		} while n != 0
		
		if self < 0 { chars.append("⁻") }
		
		return String(chars.reversed())
	}
}
