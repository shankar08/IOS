//: Playground - noun: a place where people can play

import UIKit

var amount = [5, 1, 4, 1, 4]

amount.append(11)
amount.remove(at: 2)

for x in 1..<10{
    print(x)
}

var index = 0

repeat{
    print(index*5)
    index += 1
}while (index < 5)

var numMatch = [Int:String]()
numMatch[2] = "Two"
numMatch[0] = "Zero"

//This will clear the dictionary
// numMatch = [:]

var airport: [String: String] = ["DFW":"Dallas FW", "KTM":"kathmandu","SFO":"Sanfrancisco"]

airport["LHR"] = "London"

for(airCode, airName) in airport{
    print("\(airCode) : \(airName)")
   // print(airCode)
}

var myRandom: [String: Dictionary<String,String>] = [:]

var oddNumber = [Int]()
for n in 0...49{
    oddNumber.append(2 * n + 1)
}

print(oddNumber)
