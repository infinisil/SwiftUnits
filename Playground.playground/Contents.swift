//: Playground - noun: a place where people can play

import SwiftUnits


//10N + 4kg * 3cm / (23s)^2

let a = (4 * Units.kg) * (Pre.k * 3 * Units.m)
let b = a / (23 * Units.s) ** 2
let c = 10 * Units.N + b


let height = 1.80 * Units.m         // 1.8 [m]
let weight = 70 * Units.kg          // 70.0 [kg]
let bmi = weight / height / height  // 21.6049382716049 [m⁻² kg]

let paulsHeight = height + 5 * Units.Length.cm // 1.85 [m]
//let nosense = height + weight           // assertion failed: Dimension mismatch: [m] vs [kg]


let heightInCm = height / Units.Length.cm  // 180.0 []
let weightInG = weight / Units.Mass.g    // 70000.0 []


//let hot = 50 * Units.Temperature.C            // 323.15 [K]
//let americanHot = hot / Units.Temperature.F   // 122.0


typealias T = Units.Temperature

let hot = 50 * T.C            // 323.15 [K]
let americanHot = hot / T.F   // 122.0

let fallTime = (2 * height / Units.Constants.g) ** (1%%2)   // 0.514904083664386 [s]
