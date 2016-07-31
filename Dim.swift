//
//  Dim.swift
//  SwiftUnits
//
//  Created by Silvan Mosberger on 17/05/16.
//
//



public struct Dim : CustomStringConvertible, Equatable {
	public let L, M, T, I, O, N, J: Int8
	
	private static let unitStrings = ["m", "kg", "s", "A", "K", "mol", "cd"]
	
	public static let none = Dim()
	
	public static let m = Dim(L: 1)
	public static let kg = Dim(M: 1)
	public static let s = Dim(T: 1)
	public static let A = Dim(I: 1)
	public static let K = Dim(O: 1)
	public static let mol = Dim(N: 1)
	public static let cd = Dim(J: 1)
	
	public var isDimensionless : Bool {
		return self == Dim()
	}
	
	public init(L: Int8 = 0, M: Int8 = 0, T: Int8 = 0, I: Int8 = 0, O: Int8 = 0, N: Int8 = 0, J: Int8 = 0) {
		self.L = L
		self.M = M
		self.T = T
		self.I = I
		self.O = O
		self.N = N
		self.J = J
	}
	
	public var description: String {
		let values = zip(Dim.unitStrings, [L, M, T, I, O, N, J]).filter{ $1 != 0 }
		
		if values.isEmpty {
			return "[]"
		}
		
		let strings : [String] = values.map { u in
			u.0 + (u.1 != 1 ? u.1.superscript : "")
		}
		
		return "[\(strings.joinWithSeparator(" "))]"
	}
}

extension Dim {
	var unit : Value {
		return Value(value: 1, dim: self)
	}
}

public func ==(l: Dim, r: Dim) -> Bool {
	let a = l.L == r.L
		&& l.M == r.M
		&& l.T == r.T
		&& l.I == r.I
	
	let b = l.O == r.O
		&& l.N == r.N
		&& l.J == r.J
	
	return a && b
}

private func toDim(f: (Int8, Int8) -> Int8) -> (Dim, Dim) -> Dim {
	return { l, r in
		return Dim(
			L: f(l.L, r.L),
			M: f(l.M, r.M),
			T: f(l.T, r.T),
			I: f(l.I, r.I),
			O: f(l.O, r.O),
			N: f(l.N, r.N),
			J: f(l.J, r.J)
		)
	}
}


public func +(l: Dim, r: Dim) -> Dim {
	return toDim(+)(l, r)
}

public func -(l: Dim, r: Dim) -> Dim {
	return toDim(-)(l, r)
}

public func *(l: Dim, r: Int8) -> Dim {
	
	return Dim(
		L: l.L * r,
		M: l.M * r,
		T: l.T * r,
		I: l.I * r,
		O: l.O * r,
		N: l.N * r,
		J: l.J * r
	)
}

public func /(l: Dim, r: Int8) -> Dim {
	let new = Dim(
		L: l.L / r,
		M: l.M / r,
		T: l.T / r,
		I: l.I / r,
		O: l.O / r,
		N: l.N / r,
		J: l.J / r
	)
	
	guard new * r == l else { fatalError("Dimension \(l) isn't divisible by \(r)") }
	
	return new
}

prefix func -(d: Dim) -> Dim {
	return Dim(
		L: -d.L,
		M: -d.M,
		T: -d.T,
		I: -d.I,
		O: -d.O,
		N: -d.N,
		J: -d.J
	)
}