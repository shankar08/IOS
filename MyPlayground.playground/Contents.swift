//: Playground - noun: a place where people can play

import UIKit
//import Foundation
//import Darwin
/*
var str = "Hello, playground"
var name = "shanki"

var a:Double = 12.123
var b:Int = 6

print("The product of \(a) and \(b) is \(a * Double(b))")



var array = [1,23,11,14,5,2]

array.sort()
array.removeAtIndex(1)

var myDictionary = ["momo":10, "chowmin":15, "sukuti": 22]

print("The sum of all three items is \(myDictionary["momo"]! + myDictionary["chowmin"]! + myDictionary["sukuti"]!)")

var myArray = [10,14,8,22]

for (index, value) in myArray.enumerate(){
    myArray[index] = value/2
}
print(myArray)
 */


//print(sqrt(9.0))
//
//var isPrime = true
//
//
//
//var inputNum = 1
//
//if inputNum == 1{
//    isPrime = false
//}
//if inputNum != 2 && inputNum != 1 {
//    for var i = 2; i < inputNum/2 ; i = i+1 {
//        if(inputNum % i == 0){
//            isPrime = false
//        }
//    }
//    
//}
//print(isPrime)

var str = "Helo"

var newString = str + " Shanki"

print (newString)

//for Character in newString.characters {
//
//    print (Character)
//}

var newTypeString = NSString(string: newString)

print(newTypeString)

print(newTypeString.substringToIndex(5))

print(newTypeString.substringFromIndex(6))

print(newTypeString.substringWithRange(NSRange(location: 1, length: 2)))

newTypeString.containsString("Shanki")

newTypeString.componentsSeparatedByString(" ")

newTypeString.uppercaseString
newTypeString.lowercaseString







