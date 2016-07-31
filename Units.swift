//
//  Global.swift
//  SwiftUnits
//
//  Created by Silvan Mosberger on 18/05/16.
//
//

public enum Units {
	public static let m = Dim(L: 1).unit
	public static let kg = Dim(M: 1).unit
	public static let s = Dim(T: 1).unit
	public static let A = Dim(I: 1).unit
	public static let K = Dim(O: 1).unit
	public static let mol = Dim(N: 1).unit
	public static let cd = Dim(J: 1).unit

	public static let g = Pre.m * kg
}

extension Units {
	public static let Hz = 1 / s
	public static let N = m * kg / s ** 2
	public static let Pa = N / m ** 2
	public static let J = N * m
	public static let W = J / s
	public static let C = A * s
}

extension Units {
	public enum Duration {
		public static let cm = Pre.c * m
		public static let min = 60 * s
		public static let hour = 60 * min
	}
	
	public enum Constants {
		public static let c = 299792458 * m / s
	}
}




extension Units {
	public enum Temps {
		public static let K = Units.K
		public static let F = CustomUnit(dim: Dim.K, from: { ($0 + 459.67) * 5 / 9 }, to: { $0 * 1.8 - 459.67 })
		public static let C = CustomUnit(dim: Dim.K, from: { $0 + 273.15 }, to: { $0 - 273.15 })
	}
}