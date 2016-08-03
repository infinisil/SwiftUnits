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


/**
Adds two values together.

- Requires: `l.dim` == `r.dim`, otherwise an assertion runtime error will occur.
*/
public func +<A:ValueProtocol, B:ValueProtocol>(l: A, r: B) -> Value {
	assert(l.dim == r.dim, "Dimension mismatch: \(l.dim) vs \(r.dim)")
	return Value(value: l.value + r.value, dim: l.dim)
}

/**
Subtracts `r` from `l`

- Requires: `l.dim` == `r.dim`, otherwise an assertion runtime error will occur.
*/
public func -<A:ValueProtocol, B:ValueProtocol>(l: A, r: B) -> Value {
	assert(l.dim == r.dim, "Dimension mismatch: \(l.dim) vs \(r.dim)")
	return Value(value: l.value - r.value, dim: l.dim)
}

/**
Multiplies two values together.
*/
public func *<A:ValueProtocol, B:ValueProtocol>(l: A, r: B) -> Value {
	return Value(value: l.value * r.value, dim: l.dim + r.dim)
}

/**
Divides `l` by `r`
*/
public func /<A:ValueProtocol, B:ValueProtocol>(l: A, r: B) -> Value {
	return Value(value: l.value / r.value, dim: l.dim - r.dim)
}

/**
Calculates `l` to the power of `r`.

- Requires: `l.dim * r.numerator` to be a multiple of `r.denominator`
*/
public func **<B: ValueProtocol>(l: B, r: Ratio) -> Value {
	return Value(value: pow(l.value, r.value), dim: l.dim * r.numerator / r.denominator)
}

/**
Creates a ratio representing `num` / `denom`
*/
public func %%(num: Int8, denom: Int8) -> Ratio {
	return Ratio(numerator: num, denominator: denom)
}

