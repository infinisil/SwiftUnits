//
//  Pre.swift
//  SwiftUnits
//
//  Created by Silvan Mosberger on 17/05/16.
//
//

import Darwin

public enum Pre : Int {
	case y = -24
	case z = -21
	case a = -18
	case f = -15
	case p = -12
	case n = -9
	case μ = -6
	case m = -3
	case c = -2
	case d = -1
	case da = 1
	case h = 2
	case k = 3
	case M = 6
	case G = 9
	case T = 12
	case P = 15
	case E = 18
	case Z = 21
	case Y = 24
	
	public static var ² : Pre { return Pre.h }
	public static var ⁻² : Pre { return Pre.c }
}

extension Pre : ValueProtocol {
	public var value: Double { return pow(10, Double(rawValue)) }
	public var dim: Dim { return .none }
}
