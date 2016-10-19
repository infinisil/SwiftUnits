//
//  CustomUnit.swift
//  SwiftUnits
//
//  Created by Silvan Mosberger on 17/05/16.
//
//


public struct CustomUnit {
	typealias Unit = Double
	
	let dim : Dim
	let from : (Unit) -> Double
	let to : (Double) -> Unit
}



public func *(l: Double, r: CustomUnit) -> Value {
	return Value(value: r.from(l), dim: r.dim)
}

public func /(l: Value, r: CustomUnit) -> Double {
	assert(l.dim == r.dim, "Value has dimension \(l.dim), but unit has dimension \(r.dim)")
	return r.to(l.value)
}
