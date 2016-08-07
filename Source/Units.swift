//
//  Global.swift
//  SwiftUnits
//
//  Created by Silvan Mosberger on 18/05/16.
//
//



public enum Units {
	/**
	The standard SI unit 1 metre. Defined as the length of the path travelled by light in vacuum during a time interval of 1/299,792,458 of a second.[¹](http://www.bipm.org/en/publications/si-brochure/metre.html)
	*/
	public static let m = Dim(L: 1).unit
	/**
	The standard SI unit 1 kilogram. Defined as being equal to the mass of the *International Prototype of the Kilogram*.[¹](http://www.bipm.org/en/publications/si-brochure/kilogram.html)
	*/
	public static let kg = Dim(M: 1).unit
	/**
	The standard SI unit 1 second. Defined as the duration of 9,192,631,770 periods of the radiation corresponding to the transition between the two hyperfine levels of the ground state of the caesium 133 atom.[¹](http://www.bipm.org/en/publications/si-brochure/second.html)
	*/
	public static let s = Dim(T: 1).unit
	/**
	The standard SI unit 1 ampere. The ampere is that constant current which, if maintained in two straight parallel conductors of infinite length, of negligible circular cross-section, and placed 1 metre apart in vacuum, would produce between these conductors a force equal to 2 x 10–7 newton per metre of length.[¹](http://www.bipm.org/en/publications/si-brochure/ampere.html)
	*/
	public static let A = Dim(I: 1).unit
	/**
	The standard SI unit 1 kelvin. Defined as the fraction 1/273.16 of the thermodynamic temperature of the triple point of water.[¹](http://www.bipm.org/en/publications/si-brochure/kelvin.html)
	*/
	public static let K = Dim(Θ: 1).unit
	/**
	The standard SI unit 1 mol. Defined as the amount of substance of a system which contains as many elementary entities as there are atoms in 0.012 kilogram of carbon 12.[¹](http://www.bipm.org/en/publications/si-brochure/mole.html)
	*/
	public static let mol = Dim(N: 1).unit
	/**
	The standard SI unit 1 candela. Defined as the luminous intensity, in a given direction, of a source that emits monochromatic radiation of frequency 540 x 1012 hertz and that has a radiant intensity in that direction of 1/683 watt per steradian. [¹](http://www.bipm.org/en/publications/si-brochure/candela.html)
	*/
	public static let cd = Dim(J: 1).unit
}

extension Units {
	/// Hertz (frequency)
	public static let Hz = 1 / s
	/// Radian (angle)
	public static let rad = m / m
	/// Steradian (Solid angle)
	public static let sr = m ** 2 / m ** 2
	/// Newton (force, weight)
	public static let N = m * kg / s ** 2
	/// Pascal (pressure, stress)
	public static let Pa = N / m ** 2
	/// Joule (energy, work, heat)
	public static let J = N * m
	/// Watt (power, radiant flux)
	public static let W = J / s
	/// Coulomb (electric charge, quantity of electricity)
	public static let C = A * s
	/// Volt (voltage, electrical potential difference, electromotive force)
	public static let V = W / A
	/// Farad (electrical capacitance)
	public static let F = C / V
	/// Ohm (electrical resistance, impendance, reactance)
	public static let Ω = V / A
	/// Siemens (electrical conductance)
	public static let S = A / V
	/// Weber (magnetic flux)
	public static let Wb = J / A
	/// Tesla (magnetic field strength, magnetic flux density)
	public static let T = V * s / m ** 2
	/// Henry (electrical inductance)
	public static let H = V * s / A
	/// Lumen (luminous flux)
	public static let lm = cd * sr
	/// Lux (illuminance)
	public static let lx = lm / m ** 2
	/// Becquerel (radioactivity)
	public static let Bq = 1 / s
	/// Gray (absorbed dose)
	public static let Gy = J / kg
	/// Sievert (equivalent dose)
	public static let Sv = J / kg
	/// Katal (catalytic activity)
	public static let kat = mol / s
}

extension Units {
	public enum Length {
		public static let m = Units.m
		public static let cm = Pre.c * m
		
		public static let `in` = 2.54 * cm
		public static let ft = 12 * `in`
		public static let yd = 3 * ft
		
		public static let mile = 1.60934 * Pre.k * m
		
		public static let ly = 9.460730472580800e15 * m
		public static let AU = 1.49597870700e11 * m
		public static let pc = 206264.81 * AU
		
		public enum Uncommon {
			public static let thou = 0.001 * `in`
			public static let line = `in` / 12.0
			public static let league = 3 * mile
			public static let Å = 100 * Pre.p * m
			
			public static let R_e = 6371008.8 * m
			public static let LD = 3.84402e8 * m
			public static let r_e = 2.817940285e-15 * m
			public static let λ_C = 2.426310215e-12 * m
		}
	}
	
	public enum Mass {
		public static let t = 1000 * kg
		public static let u = 1.660539040e-27 * kg
		
		public static let lb = 0.45359237 * kg
		public static let mp = 2.17651e-8 * kg
		public static let M_s = 1.98855e30 * kg
	}
	
	public enum Time {
		public static let tp = 5.39116e-44 * s
		
		
		public static let min = 60 * s
		public static let hour = 60 * min
		public static let day = 24 * hour
		public static let week = 7 * day
		public static let gregorianYear = 365.2425 * day
	}
	
	public enum Temperature {
		public static let K = Units.K
		public static let F = CustomUnit(dim: Dim.K, from: { ($0 + 459.67) * 5 / 9 }, to: { $0 * 1.8 - 459.67 })
		public static let C = CustomUnit(dim: Dim.K, from: { $0 + 273.15 }, to: { $0 - 273.15 })
	}
}

extension Units {
	public enum Data {
		public static let b = Value(value: 1)
		public static let B = 8 * b
		public static let nibble = 4 * b
		
		public static let KiB = 2 ** 10 * B
		public static let MiB = 2 ** 20 * B
		public static let GiB = 2 ** 30 * B
		public static let TiB = 2 ** 40 * B
		public static let PiB = 2 ** 50 * B
		public static let EiB = 2 ** 60 * B
	}
}

extension Units {
	public enum Volume {
		public static let l = (Pre.d * m) ** 3
	}
}

extension Units {
	public enum Constants {
		public static let π = Value(value: M_PI)
		
		/// Speed of light (exact)
		public static let c = 299792458 * m / s
		/// Gravitational constant (std uncertainty 4.7e-5)
		public static let G = 6.67408e-11 * m**3 / kg / s**2
		/// Planck constant (std uncertainy 1.2e-8)
		public static let h = 6.626070040e-34 * J / s
		/// Reduced planck constant (std uncertainty 1.2e-8)
		public static let ħ = 1.054571800e-34 * J / s
		
		/// Magnetic constant (exact)
		public static let µ_0 = 4e-7 * π * N / A**2
		/// Electric constant (exact)
		public static let ε_0 = 1 / (µ_0 * c**2)
		/// Characteristic impendance of vacuum (exact)
		public static let Z_0 = µ_0 * c
		/// Coulomb's constant (exact)
		public static let k_e = 1 / (4 * π * ε_0)
		
		/// Elementary charge (std uncertainty 2.2e-8)
		public static let e = 1.602176565e-19 * C
		
	}
}

