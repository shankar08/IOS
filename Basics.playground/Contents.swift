//: Playground - noun: a place where people can play

import UIKit

let http200Status = (statusCode: 200, description: "OK")

func greet(person: [String: String]) {
    guard let name = person["name"] else
    {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you ")
        return
    }
    print("I hope the weather is nice in \(location).")
    
}

//greet(person: ["name": "John"])

//greet(person: ["name":"Panda", "location":"NLC"])


func factorial(num: Int) -> Int {
    var factorial = 0
    for x in 1...num {
        if factorial != 0 {
            factorial = factorial * x
        } else {
            factorial = 1
        }
    }
    return factorial
}

//print("\(factorial(num: 7))")

func recfac(num: Int) -> Int {
    if num == 1{
        return 1
    } else {
        return num * recfac(num: num - 1)
    }
}

//recfac(num: 7)

// x = num + 0.30x
func myCalc(val: Int) -> Double {
    return (Double(val)/0.3)
    
}
