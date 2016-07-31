//
//  Operators.swift
//  SwiftUnits
//
//  Created by Silvan Mosberger on 17/05/16.
//
//

import Darwin

infix operator ** {
precedence 170
}

infix operator %% {
precedence 171
}



public func +<A:ValueProtocol, B:ValueProtocol>(l: A, r: B) -> Value {
	assert(l.dim == r.dim, "Dimension mismatch: [\(l.dim)] vs [\(r.dim)]")
	return Value(value: l.value + r.value, dim: l.dim)
}

public func -<A:ValueProtocol, B:ValueProtocol>(l: A, r: B) -> Value {
	assert(l.dim == r.dim, "Dimension mismatch: [\(l.dim)] vs [\(r.dim)]")
	return Value(value: l.value - r.value, dim: l.dim)
}

public func *<A:ValueProtocol, B:ValueProtocol>(l: A, r: B) -> Value {
	return Value(value: l.value * r.value, dim: l.dim + r.dim)
}

public func /<A:ValueProtocol, B:ValueProtocol>(l: A, r: B) -> Value {
	return Value(value: l.value / r.value, dim: l.dim - r.dim)
}

public func **<B: ValueProtocol>(l: B, r: Ratio) -> Value {
	return Value(value: pow(l.value, r.value), dim: l.dim * r.numerator / r.denominator)
}

public func %%(nom: Int8, denom: Int8) -> Ratio {
	return Ratio(numerator: nom, denominator: denom)
}

