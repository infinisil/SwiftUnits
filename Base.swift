//
//  Base.swift
//  SwiftUnits
//
//  Created by Silvan Mosberger on 17/05/16.
//
//




//public protocol Base {
//	associatedtype Num : Number
//}
//
//public extension Base {
//	typealias V = MyValue<Num>
//	
//	static var one : V { return Dim().unit() }
//	static var m : V { return Dim.m.unit() }
//	static var kg : V { return Dim.kg.unit() }
//	static var s : V { return Dim.s.unit() }
//	static var A : V { return Dim.A.unit() }
//	static var K : V { return Dim.K.unit() }
//	static var mol : V { return Dim.mol.unit() }
//	static var cd : V { return Dim.cd.unit() }
//	
//	static var basicUnits : [V] { return [m, kg, s, A, K, mol, cd] }
//	
//	static var g : V { return kg / 1000 }
//	static var Hz : V { return 1 / s }
//	static var N : V { return m * kg / s ** 2 }
//	static var Pa : V { return N / m ** 2 }
//	static var J : V { return N * m }
//	static var W : V { return J / s }
////	static var C : V { return A * s }
//	
//	static var cm : V { return Pre.c * m }
//	static var min : V { return 60 * s }
//	static var hour : V { return 60 * min }
//	
//	static var pi : V { return 3.14159265358979323846264338327950288419716939937510582097494459230781640628620899862803482534211706798214808651328230664709384460955058223172535940812848111745028410270193852110555964462294895493038196442881097566593344612847564823378678316527120190914564856692346034861045432664821339360726024914127360 * one }
//	
//	typealias X = Self
//	static var Temperature : Temp<X>.Type { return Temp<X>.self }
//}
//
//public enum Temp<B: Base> {
//	static var K : MyValue<B.Num> { return B.K }
//}
//
//public extension Base where Num : POFloat {
//	static var pi : MyValue<Num> { return Num.pi(1000) * one }
//}
//
//public struct OtherBase<N: Number> : Base {
//	public typealias Num = N
//}