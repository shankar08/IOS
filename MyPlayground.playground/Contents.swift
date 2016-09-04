//: Playground - noun: a place where people can play

import UIKit

var moneyVal: Int?

moneyVal = 120
if moneyVal != nil {
    print(moneyVal!)
}

if let mv = moneyVal {
    print(mv)
}


class car{
    var model: String?
    
}

var vehicle: car?
print(vehicle?.model)

vehicle = car()
vehicle?.model = "mustang"

if let m = vehicle?.model {
    print(m)
}

if let v = vehicle, let mb = v.model {
    print(mb)
}

var cars: [car]?

cars = [car]()

if let carrrr = cars where carrrr.count > 0 {
    //only executes if not nil and has has element
} else {
    cars?.append(car())
    print(cars?.count)
}




class person{
    private var _age: Int!
    
    var age: Int {
        if _age == nil{
            _age = 15
        }
        return _age
    }
    
    func setAge(newAge: Int){
        self._age = newAge
    }
    
}
var jack = person()
print(jack.age)
print(jack._age)


