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
		return "\(value) \(dim)"
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

extension ValueProtocol where Self : SignedInteger {
	public var dim : Dim { return .none }
	public var value : Double { return Double(toIntMax()) }
}

extension ValueProtocol where Self : UnsignedInteger {
	public var dim : Dim { return .none }
	public var value : Double { return Double(toUIntMax()) }
}

extension Int8 : ValueProtocol {}
extension Int16 : ValueProtocol {}
extension Int32 : ValueProtocol {}
extension Int64 : ValueProtocol {}

extension UInt8 : ValueProtocol {}
extension UInt16 : ValueProtocol {}
extension UInt32 : ValueProtocol {}
extension UInt64 : ValueProtocol {}


extension ValueProtocol {
	public var ² : Value {
		return self ** 2
	}
}
