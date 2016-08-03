//
//  Value.swift
//  SwiftUnits
//
//  Created by Silvan Mosberger on 17/05/16.
//
//

public protocol ValueProtocol {
	var dim : Dim { get }
	var value : Double { get }
}

public struct Value : ValueProtocol, CustomStringConvertible {
	public let dim : Dim
	public let value : Double
	
	public var description: String {
		return ["\(value)", "\(dim)"].joinWithSeparator(" ")
	}
	
	public init(value: Double, dim: Dim = Dim()) {
		self.dim = dim
		self.value = value
	}
}

extension Double : ValueProtocol {
	public var dim : Dim { return .none }
	public var value : Double { return self }
}

extension Float : ValueProtocol {
	public var dim: Dim { return .none }
	public var value: Double { return Double(self) }
}

extension Int : ValueProtocol {
	public var dim : Dim { return .none }
	public var value : Double { return Double(self) }
}


extension ValueProtocol {
	public var ² : Value {
		return self ** 2
	}
}