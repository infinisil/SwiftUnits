//
//  SuperscriptTests.swift
//  SwiftUnits
//
//  Created by Silvan Mosberger on 09.03.17.
//
//

import XCTest
import SwiftUnits

class SuperscriptTests: XCTestCase {
	
	func testInt8() {
		let cases : [(Int8, String)] = [
			(0, "⁰"),
			(1, "¹"),
			(-1, "⁻¹"),
			(127, "¹²⁷"),
			(-128, "⁻¹²⁸"),
			(-99, "⁻⁹⁹"),
		]
		
		for (number, string) in cases {
			XCTAssertEqual(number.superscript, string)
		}
	}
}
