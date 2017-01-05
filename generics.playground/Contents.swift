//: Playground - noun: a place where people can play

import UIKit


func intAdder(number: Int) -> Int {
    return number + 2
}

intAdder(number: 4)

func doubleAdder(number: Double) -> Double {
    return number + 2.0
}

doubleAdder(number: 9)


func genericAdder<T: Strideable> (number: T) -> T {
    return number + 2
}

genericAdder(number: 4)
genericAdder(number: 2.3)
genericAdder(number: 0.2)

protocol Numeric {
    static func *(lhs: Self, rhs: Self) -> Self
}

extension Double: Numeric {}
extension Float: Numeric {}
extension Int: Numeric {}

func genericMulti<T: Numeric>(lhs: T, rhs: T) -> T {
    return lhs * rhs
}

genericMulti(lhs: 2, rhs: 5.11)