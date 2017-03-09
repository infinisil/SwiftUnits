# SwiftUnits
Framework for working with arbitrary units in Swift (WIP, Name and repo might change)

The aim of this library is to provide a convenient and flexible API to work with [physical units](https://en.wikipedia.org/wiki/Units_of_measurement) such as meters, kilograms, Newton, bar, etc. The final version of this library will also provide a plethora of physical constants in their correct dimensions such as the speed of light in meters per second (length over time), the avogadro constant in mol^-1 and many more.

##Demo

One of the most important types provided by this library is the `Units` type. It contains every present unit and constant as a static property on either itself or one of its subtypes. You can combine any of these units/constants simply by multiplying/dividing them:

```swift
let height = 1.80 * Units.m         // 1.8 [m]
let weight = 70 * Units.kg          // 70.0 [kg]
let bmi = weight / height / height  // 21.6049382716049 [m⁻² kg]
```

You can add/subtract values together only if they have the same dimension. Otherwise a runtime error will occur:

```swift
let paulsHeight = height + 5 * Units.cm // 1.85 [m]
let nosense = height + weight           // assertion failed: Dimension mismatch: [m] vs [kg]
```

One of the beautiful things of this library is that you can work very naturally with units. Multiply your value (5) with the unit (m) to express that the value has this unit. On the other hand you can divide a value (5m) by a unit (cm) to get the value (500) in another unit:

```swift
let heightInCm = height / Units.cm  // 180.0 []
let weightInG = weight / Units.g    // 70000.0 []
```

When printing a value, the number is the amount in [SI Units](https://en.wikipedia.org/wiki/International_System_of_Units) and the square brackets tell you the dimension of it.

The `Units` type has numerous subtypes such as `Duration`, for units expressing time, `Length` for units expressing distance, etc. Out of all the units, there is a special category: Temperatures. Unlike [most] other units, there are multiple units of temperature that you can't just multiply together, because they do not have the same magnitude. To convert from Celsius to Kelvin you have to add `273.15`, and for Fahrenheit it's even more complicated. There is a special type for such units called `CustomUnit`. You can create one by providing a dimension, a `from` and a `to` conversion closure. These are defined already for temperatures and you can use them just as you normally would:

```swift
let hot = 50 * Units.Temps.C            // 323.15 [K]
let americanHot = hot / Units.Temps.F   // 122.0
```

Now having to always type `Units.***` may get cumbersome after a while. But since these are just types, you can create a `typealias` yourself:

```swift
typealias T = Units.Temps

let hot = 50 * T.C            // 323.15 [K]
let americanHot = hot / T.F   // 122.0
```

This framework defines two now operators: The `**` operator for exponentiation (should be familiar) and the `%%` operator for creating rational numbers (similar to [`%` in Haskell](http://hackage.haskell.org/package/base-4.9.0.0/docs/Data-Ratio.html#v:-37-)). Doing `** 1%%2` is equal to taking the square root.

```swift
let height = 1.3 * Units.m                                // 1.3 [m]
let fallTime = (2 * height / Units.Constants.g) ** 1%%2   // 0.514904083664386 [s]
```

## Philosophy

Before this library got created, I experimented with encoding the dimension of units into the type system, so that all the checks could be done at compile-time. I quickly realized that Swift's type system is not nearly powerful enough to do this. Dependent types are only available in a [very limited fashion](https://bigonotetaking.wordpress.com/2015/09/06/yet-more-misunderstanding-of-dependent-types/) in Swift. In a language like [Idris](http://www.idris-lang.org) (which you should totally check out, it's awesome), this would indeed be possible because of its powerful type system.

## Comparison with other libraries

### Types

There are currently three types of libraries, each having it's own pros and cons:

#### Type 1: [SI](https://en.wikipedia.org/wiki/International_System_of_Units)-based

Supports addition and multiplication with arbitrary values of any unit type. Calculations such as `10N + 4kg * 3cm / (23s)^2 = 32.68N` are possible, as each value has both a magnitude (number) and a dimension (e.g. Length^-1, Mass * Duration). In Swift it is not possible to verify that on addition the two values have the same dimension at compile-time.

#### Type 2: [Quantity](https://en.wikipedia.org/wiki/Physical_quantity)-based

Each quantity (e.g. Length, Velocity, Force, etc.) is represented as its own type, encapsulating conversion between units. This enables one to catch errors such as `1s + 3m` at compile-time by only defining addition on values with the same quantities. The drawback is that you cannot have easy calculations with different quantities (e.g. `1m / 1s` errors on compile-time). Flexibility is very limited.

#### Type 3: [Quantity](https://en.wikipedia.org/wiki/Physical_quantity)-based with operators

Basically the same as the previous type, but with operators that manually define calculations between quantities. This enables calculations such as `1m / 1s = 1m/s`. It also comes with compile-time checking of all implemented calculations, compilation implies correct usage (not the other way around though). A big drawback is that a lot of hard coding is required and abstraction is low.

### Comparison

Library | Author | State | Type | Extendability | Documentation | Platforms | Swift version | Notes
------- | ------ | ----- | ------ | ------------- | -------------
SwiftUnits | @infinisil | usable | 1 | easy| no | macOS/iOS/tvOS/watchOS | 3 | class-based
[MKUnits](https://github.com/michalkonturek/MKUnits) | @michalkonturek | finished | 2 | possible | yes | iOS | 3 |
[Quantities](https://github.com/BradLarson/Quantities) | @BradLarson | usable | 2 | no | no | macOS/iOS | 3 |
[Swift Units](https://github.com/danielpi/Swift-Units) | @danielpi | experimental | 3 | hardly | no | macOS | 2.3 |
[Measurement & Unit](https://developer.apple.com/reference/foundation/unit) | Apple | stable | 2 | possible | yes | macOS/iOS/tvOS/watchOS | 3 |

[continued...]
